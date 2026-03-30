# Maintainer: lo0pH0L3z
pkgname=antigravity-tarball
pkgver=1.21.6
pkgrel=1
pkgdesc="Agentic development platform from Google"
arch=('x86_64')
url="https://antigravity.google/"
license=('LicenseRef-proprietary')
depends=('alsa-lib' 'gtk3' 'libsecret' 'nss' 'libx11' 'libxkbfile' 'libgl' 'libxss' 'libxcb')
optdepends=('libdbusmenu-gtk3: Global menu support')
provides=('antigravity')
conflicts=('antigravity-bin')
install=antigravity.install

# Build ID from Google's CDN URL — update this alongside pkgver on each release
_build_id="5723021441368064"

noextract=("Antigravity.tar.gz")
source=("Antigravity.tar.gz::https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_build_id}/linux-x64/Antigravity.tar.gz")
sha256sums=('36fb3b270067c9654c0157a8f8b1ccf5986579f7f2f8e367cfb1616515f9eb14')

package() {
  # Extract tarball into srcdir
  tar -xzf "${srcdir}/Antigravity.tar.gz" -C "${srcdir}"

  # Install app bundle to /usr/share/antigravity
  install -dm755 "${pkgdir}/usr/share/antigravity"
  cp -r "${srcdir}/Antigravity/." "${pkgdir}/usr/share/antigravity/"

  # Fix permissions on main executable and helpers
  chmod 755 "${pkgdir}/usr/share/antigravity/antigravity"
  chmod 755 "${pkgdir}/usr/share/antigravity/chrome_crashpad_handler"

  # chrome-sandbox must be owned by root and setuid
  chown root:root "${pkgdir}/usr/share/antigravity/chrome-sandbox"
  chmod 4755 "${pkgdir}/usr/share/antigravity/chrome-sandbox"

  # Wrapper script in /usr/bin so it's in PATH
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/antigravity" << 'WRAPPER'
#!/bin/bash
# Wrapper for Antigravity
# Uncomment below for native Wayland:
# export ANTIGRAVITY_FLAGS="--ozone-platform=wayland"
exec /usr/share/antigravity/antigravity "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/antigravity"

  # Desktop entry
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/antigravity.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Antigravity
Comment=Agentic development platform from Google
GenericName=Text Editor
Exec=/usr/bin/antigravity %F
Icon=antigravity
Type=Application
StartupNotify=true
StartupWMClass=antigravity
Categories=Development;IDE;
MimeType=text/plain;inode/directory;
Keywords=antigravity;google;ai;ide;editor;
DESKTOP

  # Icon
  install -Dm644 \
    "${srcdir}/Antigravity/resources/app/resources/linux/code.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/antigravity.png"

  # License stub
  install -Dm644 /dev/null "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo "Proprietary — see https://antigravity.google/terms" \
    > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
