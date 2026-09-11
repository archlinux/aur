# Maintainer: Daniel Escoz <darkhogg+aur.nosqlbooster-mongodb@gmail.com>
pkgname=nosqlbooster-mongodb
pkgver=11.1.6
_majorver="$(echo $pkgver | sed -E 's/\..+$//')"
pkgrel=1
pkgdesc="Shell-centric GUI tool for MongoDB"
arch=('x86_64')
url="https://nosqlbooster.com"
license=('custom')
depends=(gconf libnotify libxss libxtst)
makedepends=()
optdepends=()
source=(nsqlb4m-${pkgver}.AppImage::https://s3.nosqlbooster.com/download/releasesv${_majorver}/nosqlbooster4mongo-${pkgver}-x64.AppImage
        LICENSE)
noextract=(nsqlb4m-${pkgver}.AppImage)
md5sums=('b6eb7ab05f53e1f1939dee2ba06d1e77'
         'fab008e596133037239e4a206bba3ccf')
sha1sums=('ea92fb95098acbe080e11c1ec3b4e09f05720c67'
          'de718440354eb3c4844eda1b90bf092dcec4cf87')
sha256sums=('1c1f401a43627507fef8d1e344ac7f881827c7dc5b4e9bca4e7f046275702060'
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

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/nosqlbooster-mongodb/nosqlbooster4mongo "$pkgdir/usr/bin/nosqlbooster4mongo"
  ln -s /opt/nosqlbooster-mongodb/nbcli "$pkgdir/usr/bin/nbcli"
}
