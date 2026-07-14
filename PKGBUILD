# Maintainer: Daniel Escoz <darkhogg+aur.nosqlbooster-mongodb@gmail.com>
pkgname=nosqlbooster-mongodb
pkgver=11.0.5
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
md5sums=('be6bc837136594c8f2f02e4bd9b853a1'
         'fab008e596133037239e4a206bba3ccf')
sha1sums=('3e2ca00c2d11a8042872c5c18a5578678f12d97f'
          'de718440354eb3c4844eda1b90bf092dcec4cf87')
sha256sums=('38e200f79099ba0b4e223578e5078a719e0d6c6f49661ec3011eb58059f11651'
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
