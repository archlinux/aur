# Maintainer: ArDali <support@ardali.app>
# AUR package for Arch-based distros.
# We download the AppImage to extract the necessary bundled libraries (libbass, libprojectM)
# but we DISCARD the old system libraries (like glib, gstreamer, wayland) to let the app
# run on the native Arch Linux stack. This fixes YouTube and Vulkan/Wayland crashes.

pkgname=ardali-bin
pkgver=4.1.8
pkgrel=5
pkgdesc="ArDali WebMedia multimedia ecosystem for Linux"
arch=('x86_64')
url="https://ardali.app"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'glib-networking'
  'gst-libav'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
)
provides=('ardali' 'ardali-webmedia')
conflicts=('ardali' 'aurivo-bin')
options=(!strip !debug)

_owner="Muhammed-Dali"
_repo="ArDali"
_tag="v${pkgver}"
_appimage="ArDali.WebMedia_${pkgver}_amd64.AppImage"

source=(
  "https://github.com/${_owner}/${_repo}/releases/download/${_tag}/${_appimage}"
)
sha256sums=('ccaa8b7a4763c72ef82944c5f7770b6df81e99fb74553c16067f5b7eddc55a7a')

build() {
  cd "${srcdir}"
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

package() {
  cd "${srcdir}/squashfs-root"

  # We use /opt/ardali-webmedia to avoid conflicts with system libraries like libprojectM
  install -dm755 "${pkgdir}/opt/ardali-webmedia/lib"
  
  # 1. Install real binary to /opt
  install -Dm755 usr/bin/ardali-webmedia "${pkgdir}/opt/ardali-webmedia/ardali-webmedia"

  # 2. Install custom application libraries to /opt/ardali-webmedia/lib
  install -Dm755 usr/lib/libbass.so "${pkgdir}/opt/ardali-webmedia/lib/libbass.so"
  cp -a usr/lib/libprojectM*.so* "${pkgdir}/opt/ardali-webmedia/lib/"

  # 3. Copy visualizer resources
  if [ -d "usr/lib/ardali-webmedia" ]; then
    cp -r usr/lib/ardali-webmedia/* "${pkgdir}/opt/ardali-webmedia/"
  fi

  # 4. Create a wrapper script in /usr/bin to set LD_LIBRARY_PATH
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/ardali-webmedia" << 'EOF'
#!/bin/sh
export LD_LIBRARY_PATH="/opt/ardali-webmedia/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec /opt/ardali-webmedia/ardali-webmedia "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/ardali-webmedia"
  ln -s /usr/bin/ardali-webmedia "${pkgdir}/usr/bin/ardali"

  # 5. Install Desktop file and fix Exec and Categories
  install -dm755 "${pkgdir}/usr/share/applications"
  install -m644 "usr/share/applications/ArDali WebMedia.desktop" "${pkgdir}/usr/share/applications/ardali-webmedia.desktop"
  sed -i 's/^Categories=.*/Categories=AudioVideo;Audio;Video;Network;Player;/' "${pkgdir}/usr/share/applications/ardali-webmedia.desktop"

  # 6. Copy icons
  cp -r usr/share/icons "${pkgdir}/usr/share/"
}
