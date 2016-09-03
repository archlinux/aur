# Maintainer: Virgil Dupras <hsoft@hardcoded.net>
pkgname=moneyguru
pkgver=2.10.2
pkgrel=1
pkgdesc="Personal finance management application"
arch=(any)
url="http://www.hardcoded.net/moneyguru/"
license=('BSD')
depends=('python' 'python-pyqt5')
makedepends=()
source=(https://download.hardcoded.net/$pkgname-src-$pkgver.tar.gz)
md5sums=('d527c103e056f94e66337091f8f006da')

build() {
  cd "$srcdir"
  ./bootstrap.sh
  msg "Starting build..."
  . env/bin/activate
  python build.py --clean
}

package() {
  cd "$srcdir"  
  mkdir -p "${pkgdir}/usr/share/applications"
  cp "debian/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  
  python package.py --arch-pkg
  cd "build/${pkgname}-arch"
  
  mkdir -p "$pkgdir/usr/share/${pkgname}"
  cp -a * "$pkgdir/usr/share/${pkgname}/"
  chmod a+x "$pkgdir/usr/share/${pkgname}/run.py"
  
  mkdir -p "$pkgdir/usr/bin"
  ln -s ../share/${pkgname}/run.py "$pkgdir/usr/bin/${pkgname}"
}


