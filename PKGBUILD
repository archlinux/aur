# Maintainer: George Alexiou <goten002@gmail.com>

pkgname=dadroit-json-viewer
_appimage=DadroitJSONViewer
pkgver=3.3.0.604
pkgrel=1
pkgdesc="Viewer for very large JSON and JSON Lines files (free for non-commercial use)"
arch=('x86_64')
url="https://dadroit.com"
license=('LicenseRef-Dadroit')
depends=('at-spi2-core' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2' 'hicolor-icon-theme' 'libx11' 'pango' 'zlib')
makedepends=('imagemagick')
options=('!strip' '!debug')
# Upstream URL is unversioned: the pinned checksum fails when a new build is
# published, which is the signal to bump pkgver (read it with: strings -el DadroitViewer).
source=("${_appimage}-${pkgver}.AppImage::https://dadroit.com/releases/lnx/${_appimage}.AppImage"
        "${pkgname}.desktop"
        "LICENSE")
noextract=("${_appimage}-${pkgver}.AppImage")
sha256sums=('7b6f63f9a043e0d1d38cb203636151b04bb4f254a760fe4dd1725def710e0124'
            '611d8581aaedb9b0e8bc6980aca0bdcb2b2ad0187262cc2cdfc046133cb6595d'
            '702557ad2b7fd71f5495dc28dc6773fa3366ecdc6206c0fdaa074745eb86abaf')

prepare() {
  chmod +x "${_appimage}-${pkgver}.AppImage"
  rm -rf squashfs-root
  "./${_appimage}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

build() {
  # Upstream ships only a 1024x1024 icon (mislabelled in several size dirs).
  local size
  for size in 16 32 48 64 128 256 512; do
    magick squashfs-root/DadroitViewer.png -resize "${size}x${size}" "icon-${size}.png"
  done
}

package() {
  install -Dm755 squashfs-root/DadroitViewer "${pkgdir}/usr/lib/${pkgname}/DadroitViewer"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/DadroitViewer" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

  local size
  for size in 16 32 48 64 128 256 512; do
    install -Dm644 "icon-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
