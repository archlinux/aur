# Maintainer: ArDali <support@ardali.app>
# AUR package for Arch-based distros.
# We download the AppImage to extract the necessary bundled libraries (libbass, libprojectM)
# but we DISCARD the old system libraries (like glib, gstreamer, wayland) to let the app
# run on the native Arch Linux stack. This fixes YouTube and Vulkan/Wayland crashes.

pkgname=ardali-bin
pkgver=4.1.8
pkgrel=4
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

  # 1. Install binary
  install -Dm755 usr/bin/ardali-webmedia "${pkgdir}/usr/bin/ardali-webmedia"
  ln -s /usr/bin/ardali-webmedia "${pkgdir}/usr/bin/ardali"

  # 2. Install ONLY the custom application libraries (libbass, libprojectM)
  install -Dm755 usr/lib/libbass.so "${pkgdir}/usr/lib/libbass.so"
  cp -a usr/lib/libprojectM*.so* "${pkgdir}/usr/lib/"

  # 3. Copy visualizer resources
  if [ -d "usr/lib/ardali-webmedia" ]; then
    mkdir -p "${pkgdir}/usr/lib/ardali-webmedia"
    cp -r usr/lib/ardali-webmedia/* "${pkgdir}/usr/lib/ardali-webmedia/"
  fi

  # 4. Install Desktop file and fix categories
  install -Dm644 "usr/share/applications/ArDali WebMedia.desktop" "${pkgdir}/usr/share/applications/ardali-webmedia.desktop"
  sed -i 's/^Categories=.*/Categories=AudioVideo;Audio;Video;Network;Player;/' "${pkgdir}/usr/share/applications/ardali-webmedia.desktop"

  # 5. Copy icons
  cp -r usr/share/icons "${pkgdir}/usr/share/"
}
