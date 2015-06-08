# Maintainer: Virgil Dupras <hsoft@hardcoded.net>
pkgname=moneyguru
pkgver=2.8.2
pkgrel=1
pkgdesc="Personal finance management application"
arch=(any)
url="http://www.hardcoded.net/moneyguru/"
license=('BSD')
depends=('python' 'python-pyqt4')
makedepends=(
)
source=(http://download.hardcoded.net/$pkgname-src-$pkgver.tar.gz)
md5sums=('c4f1b9d21d22306a4124135356de4548')

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
  
  python package.py
  cd "build/${pkgname}-arch"
  
  mkdir -p "$pkgdir/usr/share/${pkgname}"
  cp -a * "$pkgdir/usr/share/${pkgname}/"
  chmod a+x "$pkgdir/usr/share/${pkgname}/run.py"
  
  mkdir -p "$pkgdir/usr/bin"
  ln -s ../share/${pkgname}/run.py "$pkgdir/usr/bin/${pkgname}"
}
