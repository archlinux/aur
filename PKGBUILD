# Maintainer: Virgil Dupras <hsoft@hardcoded.net>
pkgname=moneyguru
pkgver=2.9.4
pkgrel=1
pkgdesc="Personal finance management application"
arch=(any)
url="http://www.hardcoded.net/moneyguru/"
license=('BSD')
depends=('python' 'python-pyqt4')
makedepends=(
)
source=(https://download.hardcoded.net/$pkgname-src-$pkgver.tar.gz)
md5sums=('1be793ad95ae09ad8e96360de797914b')

build() {
  cd "$srcdir"
  ./bootstrap.sh
  msg "Starting build..."
  . env/bin/activate
  python configure.py
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
