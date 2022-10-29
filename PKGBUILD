# Maintainer: Curve <curve.platin at gmail.com>
pkgname=olive-nightly-bin
_pkgname=olive

pkgver=0.2.0_413427222
pkgrel=1

license=('GPL3')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"

provides=("olive")
conflicts=("olive")

arch=('x86_64')
makedepends=(unzip)
options+=('!strip')
depends=('openexr' 'ffmpeg' 'openimageio' 'opencolorio' 'portaudio' 'qt5-base' 'opentimelineio')

source=(Olive_$pkgver.AppImage.zip::$(curl --request POST --url https://www.olivevideoeditor.org/ghret.php --header 'Content-Type: multipart/form-data' --form id=$(echo "$pkgver" | grep -o -E "_[[:digit:]]+" | grep -o -E "[[:digit:]]+")))

sha256sums=('SKIP')

pkgver() {
  echo "0.2.0_$( curl "https://olivevideoeditor.org/nightly.php" | grep -o -a -E "<a[^h]+href='go.php\?id=([[:digit:]]+)'[^>]+>Download</a>" | head -1 | grep -o -E "[[:digit:]]+" )"
}

prepare() {
  chmod +x Olive*-x86_64.AppImage
  ./Olive*-x86_64.AppImage --appimage-extract
}

package() {
  # Missing Directories

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"

  # Binaries

  install -m755 "${srcdir}/squashfs-root/usr/bin/"${_pkgname}-editor "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/squashfs-root/usr/bin/"${_pkgname}-crashhandler "${pkgdir}/usr/bin/"

  # Desktop File

  install -m644 "${srcdir}/squashfs-root/org.olivevideoeditor.Olive.desktop" "${pkgdir}/usr/share/applications/"

  # Other files

  cp -r "${srcdir}/squashfs-root/usr/share" "${pkgdir}/usr/"
}