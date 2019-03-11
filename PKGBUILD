# Maintainer: Oirio Joshi <joshirio@protonmail.com>
pkgname=iotacooler
pkgver=1.1
pkgrel=3
pkgdesc="Cold transaction signer for IOTA"
arch=('x86_64')
url="https://github.com/joshirio/iota-cooler"
license=('MIT')
depends=('qt5-base' 'qt5-svg' 'qt5-imageformats')
makedepends=('git' 'nodejs' 'npm')
source=("https://github.com/joshirio/iota-cooler/releases/download/v$pkgver/$pkgname-$pkgver-src.tar.gz")
md5sums=('e15d948e8796f0448bcebea2c03aa049')
options=('!strip') #skip because iotacooler-smidgen doesn't work: 'pkg: failed to read file'

build() {
  # iotacooler
  git clone https://github.com/joshirio/Qt-AES.git utils/Qt-AES/
  qmake-qt5 -config release
  make
  
  # iotacooler-smidgen
  git clone --branch iotacooler-v$pkgver https://github.com/joshirio/iota-cooler-smidgen.git
  npm install pkg
  cd iota-cooler-smidgen/
  npm install 
  node ../node_modules/pkg/lib-es5/bin.js  . --target node10-linux -o iotacooler-smidgen #node10 last known working version
}

package() {
  cd "$srcdir"

  # Binaries
  install -Dm755 "$srcdir/iota-cooler" "${pkgdir}/usr/bin/iota-cooler"
  install -Dm755 "$srcdir/iota-cooler-smidgen/iotacooler-smidgen" "${pkgdir}/usr/bin/iotacooler-smidgen"

  # Icons and desktop files
  install -d "${pkgdir}/usr/share/"
  cp -R "$srcdir/stuff/deployment/linux/appimage/usr/share/applications/" "${pkgdir}/usr/share/"
  cp -R "$srcdir/stuff/deployment/linux/appimage/usr/share/pixmaps/" "${pkgdir}/usr/share/"

  # Copy license
  install -Dm644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
