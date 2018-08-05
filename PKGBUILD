# Maintainer: Daniel Escoz <darkhogg+aur.nosqlbooster-mongodb@gmail.com>
pkgname=nosqlbooster-mongodb
pkgver=4.7.0
pkgrel=1
pkgdesc="Shell-centric GUI tool for MongoDB"
arch=('x86_64')
url="https://nosqlbooster.com"
license=('GPL')
depends=(gconf libnotify libxss libxtst)
makedepends=()
optdepends=()
source=(nsqlb4m.AppImage::https://nosqlbooster.com/s3/download/releasesv4/nosqlbooster4mongo-4.7.0.AppImage)
noextract=(nsqlb4m.AppImage)
md5sums=('da91339b27d5bdccc404fbdc47c41839')
sha1sums=('78717b7308c16734623b2be38a822825416e7b0f')
sha256sums=('4fe6dad993aefbcb1ab47848e8c8c3085873eed0e18370d12e28bccedb9158be')

build() {
  cd "$srcdir"

  chmod +x nsqlb4m.AppImage
  ./nsqlb4m.AppImage --appimage-extract

  chmod +x 'squashfs-root/app/nosqlbooster4mongo'

  sed -E \
    -e '/X-/d' \
    -e 's#^Exec=.*$#Exec=/opt/nosqlbooster-mongodb/nosqlbooster4mongo#' \
    -i 'squashfs-root/nosqlbooster4mongo.desktop'
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr"
  cp -r "squashfs-root/usr/share" "${pkgdir}/usr/share"

  install -d "${pkgdir}/opt"
  cp -r "squashfs-root/app" "${pkgdir}/opt/nosqlbooster-mongodb"

  install -D 'squashfs-root/nosqlbooster4mongo.desktop' "${pkgdir}/usr/share/applications/nosqlbooster4mongo.desktop"
  find "$pkgdir" -type d -exec chmod 755 {} +
}
