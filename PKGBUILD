# Maintainer: Daniel Escoz <darkhogg+aur.nosqlbooster-mongodb@gmail.com>
pkgname=nosqlbooster-mongodb
pkgver=8.0.8
_majorver="$(echo $pkgver | sed -E 's/\..+$//')"
pkgrel=1
pkgdesc="Shell-centric GUI tool for MongoDB"
arch=('x86_64')
url="https://nosqlbooster.com"
license=('custom')
depends=(gconf libnotify libxss libxtst)
makedepends=()
optdepends=()
source=(nsqlb4m-${pkgver}.AppImage::https://nosqlbooster.com/s3/download/releasesv${_majorver}/nosqlbooster4mongo-${pkgver}.AppImage
        LICENSE)
noextract=(nsqlb4m-${pkgver}.AppImage)
md5sums=('bc4e2545869944564813c9f007bc3b0d'
         'fab008e596133037239e4a206bba3ccf')
sha1sums=('29fbdb1f909f60236dbad67b3a3bf9c6410efa1a'
          'de718440354eb3c4844eda1b90bf092dcec4cf87')
sha256sums=('ffd9c939f60d86a6171ee1d4d30c3b5b5efc627f1acdb59d1fed19fcaf2d17aa'
            '1640d17baeee24279f7d998719e37a331c8e12627c755b4b250f1c95b16f032f')

build() {
  cd "$srcdir"

  chmod +x nsqlb4m-${pkgver}.AppImage
  ./nsqlb4m-${pkgver}.AppImage --appimage-extract

  chmod +x 'squashfs-root/nosqlbooster4mongo'

  sed -E \
    -e '/X-/d' \
    -e 's#^Exec=.*$#Exec=/opt/nosqlbooster-mongodb/nosqlbooster4mongo#' \
    -i 'squashfs-root/nosqlbooster4mongo.desktop'
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/opt"
  cp -r "squashfs-root/." "${pkgdir}/opt/nosqlbooster-mongodb/"
  rm -rf "${pkgdir}/opt/nosqlbooster-mongodb/usr/share"

  install -d "${pkgdir}/usr"
  cp -r "squashfs-root/usr/share/." "${pkgdir}/usr/share/"

  install -D 'squashfs-root/nosqlbooster4mongo.desktop' "${pkgdir}/usr/share/applications/nosqlbooster4mongo.desktop"
  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
