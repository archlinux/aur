# Maintainer: Sergey Kuznetsov <arch@phnx47.net>
pkgname=nosqlbooster4mongo47
pkgver=4.7.5
_majorver=4
pkgrel=1
pkgdesc="Shell-centric GUI tool for MongoDB"
arch=('x86_64')
url="https://nosqlbooster.com"
license=('custom')
depends=(gconf libnotify libxss libxtst)
conflicts=(nosqlbooster-mongodb)
makedepends=()
optdepends=()
source=(nsqlb4m-${pkgver}.AppImage::https://nosqlbooster.com/s3/download/releasesv${_majorver}/nosqlbooster4mongo-${pkgver}.AppImage
        LICENSE)
noextract=(nsqlb4m-${pkgver}.AppImage)
md5sums=('c4925cf3172e1734960b8f10f5ec5c89'
         '201912e7286dae4ecb5e09a5912d82e1')
sha1sums=('a8cbfbe43a0bf1268c0403d4cdfeeace9aaedaa5'
          'fc3ab85af0f8442aa5da6c41aacb09c79d5e2823')
sha256sums=('a94567f2737f0beff2d617b2dab72f32eab0b9da31c57931927ba95df8497791'
            '8dc0a2b535b8d2c88d9457fcc3937777b0068a4d396c1d344fba741c54682840')

build() {
  cd "$srcdir"

  chmod +x nsqlb4m-${pkgver}.AppImage
  ./nsqlb4m-${pkgver}.AppImage --appimage-extract

  chmod +x 'squashfs-root/app/nosqlbooster4mongo'

  sed -E \
    -e '/X-/d' \
    -e 's#^Exec=.*$#Exec=/opt/nosqlbooster4mongo47/app/nosqlbooster4mongo#' \
    -i 'squashfs-root/nosqlbooster4mongo.desktop'
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/opt"
  cp -r "squashfs-root/." "${pkgdir}/opt/nosqlbooster4mongo47/"
  rm -rf "${pkgdir}/opt/nosqlbooster4mongo47/usr/share"

  install -d "${pkgdir}/usr"
  cp -r "squashfs-root/usr/share/." "${pkgdir}/usr/share/"

  install -D 'squashfs-root/nosqlbooster4mongo.desktop' "${pkgdir}/usr/share/applications/nosqlbooster4mongo.desktop"
  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
