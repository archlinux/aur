# Maintainer: robertfoster

pkgname=openbazaar
pkgver=2.4.10
pkgrel=2
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(i686 x86_64)
url="https://github.com/OpenBazaar/openbazaar-desktop"
license=('MIT')
depends=('electron6')
optdepends=('openbazaard: server daemon occasionally needed by front-end')
makedepends=('npm')
source=("${url}/archive/refs/tags/v$pkgver.tar.gz"
  "$pkgname.js"
  "$pkgname.desktop"
)
install=$pkgname.install
options=('!strip')

prepare() {
  cd $srcdir/$pkgname-desktop-$pkgver
  sed -i '/electron/d' package.json
  npm install --save node-sass@5.0.0
  npm install --silent
}

build() {
  cd $srcdir/$pkgname-desktop-$pkgver
  npm run build
  npm prune --production
}

package() {
  cd $srcdir
  appdir="usr/lib/$pkgname"

  install -d $pkgdir/${appdir%%/$pkgname}
  cp -rf $pkgname-desktop-$pkgver $pkgdir/$appdir
  install -Dm755 $pkgname.js $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname-desktop-$pkgver/imgs/icon.png $pkgdir/usr/share/pixmaps/${pkgname}2.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  cd $pkgdir/$appdir
  rm -rf .git*
  rm -rf .travis
  cp -rf prod/* js/
  find "${pkgdir}"/${appdir} \
    -name "bin" -prune -exec rm -r '{}' \; \
    -or -name "example" -prune -exec rm -r '{}' \; \
    -or -name "examples" -prune -exec rm -r '{}' \; \
    -or -name "test" -prune -exec rm -r '{}' \;

  pathtoreplace=$(echo ${srcdir}/ | sed 's:/:\\\/:g')
  find "$pkgdir/$appdir/node_modules/" -name "*.json" -exec \
    sed -i "s/$pathtoreplace//g" {} +
}

sha256sums=('64d5249403887f06bb02b2c4c634f1cba11bd0c90523ab834505e5923efcdadc'
            '3fa782ec97bd622f9012e1c77eaf1e052d3d5623ee1c033a41fa573a7153989a'
            'ad0d0f577425e194d3da6db5d5cd262302a88e3937d8d2e6545d7295847255e5')
