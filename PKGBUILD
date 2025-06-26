# Maintainer: OpenSource Guy <osguy@duck.com>
# Project By Nerimity Team <https://github.com/Nerimity>
# Last synchronized: 2025-06-26 15:05:03

pkgname=nerimity-appimage
pkgver=1.6.3
pkgrel=1
pkgdesc="Nerimity - A modern chat application (AppImage)"
arch=('x86_64')
url="https://github.com/Nerimity/nerimity-desktop"
license=('custom:unknown')
depends=('fuse2' 'hicolor-icon-theme' 'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('curl' 'jq')
provides=('nerimity')
conflicts=('nerimity')
options=(!strip)
install="${pkgname}.install"

pkgver() {
  # Get latest version from GitHub API
  curl -s "https://api.github.com/repos/Nerimity/nerimity-desktop/releases/latest" | jq -r .tag_name | sed 's/^v//g'
}

prepare() {
  # Get the latest version
  local _latest_ver=$(pkgver)
  
  # Set the download URL
  local _download_url="https://github.com/Nerimity/nerimity-desktop/releases/download/v${_latest_ver}/Nerimity-${_latest_ver}.AppImage"
  
  msg2 "Checking for version ${_latest_ver}..."
  
  # Check if the URL exists before downloading
  if curl --output /dev/null --silent --head --fail "${_download_url}"; then
    msg2 "Downloading version ${_latest_ver}..."
    curl -L "${_download_url}" -o "${srcdir}/${pkgname}-${_latest_ver}.AppImage"
    chmod +x "${srcdir}/${pkgname}-${_latest_ver}.AppImage"
  else
    error "Version ${_latest_ver} not found. Please check the package version."
    exit 1
  fi
}

package() {
  cd "${srcdir}"
  
  # Use the downloaded AppImage
  local _latest_ver=$(pkgver)
  local _appimage="${pkgname}-${_latest_ver}.AppImage"
  
  # Create directories
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/opt/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -dm755 "${pkgdir}/usr/share/metainfo"
  
  # Install AppImage
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/nerimity.AppImage"
  
  # Extract AppImage to get icon and desktop file
  msg2 "Extracting AppImage to get icon..."
  "./${_appimage}" --appimage-extract

  # Create icon directories
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/"{16x16,32x32,48x48,64x64,128x128,256x256,512x512}"/apps"
  
  # Try to find and install icons in various possible locations
  for size in 16 32 48 64 128 256 512; do
    if [ -f "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/nerimity.png" ]; then
      install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/nerimity.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/nerimity.png"
    fi
  done
  
  # Try to find the icon in other common locations
  if [ -f "squashfs-root/usr/share/icons/hicolor/0x0/apps/nerimity.png" ]; then
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/0x0/apps/nerimity.png" "${pkgdir}/usr/share/pixmaps/nerimity.png"
  elif [ -f "squashfs-root/nerimity.png" ]; then
    install -Dm644 "squashfs-root/nerimity.png" "${pkgdir}/usr/share/pixmaps/nerimity.png"
  elif [ -f "squashfs-root/usr/share/pixmaps/nerimity.png" ]; then
    install -Dm644 "squashfs-root/usr/share/pixmaps/nerimity.png" "${pkgdir}/usr/share/pixmaps/nerimity.png"
  elif [ -f "squashfs-root/.DirIcon" ]; then
    install -Dm644 "squashfs-root/.DirIcon" "${pkgdir}/usr/share/pixmaps/nerimity.png"
  fi
  
  # If we still don't have an icon in pixmaps, copy one of the hicolor icons
  if [ ! -f "${pkgdir}/usr/share/pixmaps/nerimity.png" ] && [ -f "${pkgdir}/usr/share/icons/hicolor/256x256/apps/nerimity.png" ]; then
    install -Dm644 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/nerimity.png" "${pkgdir}/usr/share/pixmaps/nerimity.png"
  fi
  
  # Check if the AppImage has a desktop file we can use
  if [ -f "squashfs-root/usr/share/applications/nerimity.desktop" ]; then
    # Use the desktop file from the AppImage but update the Exec path
    sed "s|^Exec=.*|Exec=/opt/${pkgname}/nerimity.AppImage %U|g" "squashfs-root/usr/share/applications/nerimity.desktop" > "${pkgdir}/usr/share/applications/nerimity.desktop"
  else
    # Create our own desktop file
    cat > "${pkgdir}/usr/share/applications/nerimity.desktop" << EOF
[Desktop Entry]
Name=Nerimity
GenericName=Chat Client
Comment=A modern chat application
Exec=/opt/${pkgname}/nerimity.AppImage %U
Terminal=false
Type=Application
Icon=nerimity
Categories=Network;InstantMessaging;Chat;
StartupWMClass=Nerimity
StartupNotify=true
Keywords=chat;messaging;im;
EOF
  fi
  
  # Make sure the desktop file has correct permissions
  chmod 644 "${pkgdir}/usr/share/applications/nerimity.desktop"

  # Create launcher script
  cat > "${pkgdir}/usr/bin/nerimity" << EOF
#!/bin/sh
exec /opt/${pkgname}/nerimity.AppImage "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/nerimity"
  
  # Create metainfo file
  cat > "${pkgdir}/usr/share/metainfo/nerimity.metainfo.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.nerimity.Nerimity</id>
  <name>Nerimity</name>
  <summary>A modern chat application</summary>
  <description>
    <p>Nerimity is a modern chat application with a focus on performance and usability.</p>
  </description>
  <categories>
    <category>Network</category>
    <category>InstantMessaging</category>
    <category>Chat</category>
  </categories>
  <url type="homepage">https://github.com/Nerimity/nerimity-desktop</url>
  <launchable type="desktop-id">nerimity.desktop</launchable>
  <provides>
    <binary>nerimity</binary>
  </provides>
</component>
EOF
  
  # Clean up
  rm -rf squashfs-root
} 