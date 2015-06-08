# Maintainer: Virgil Dupras <hsoft@hardcoded.net>
pkgname=dupeguru-se
pkgver=3.9.1
pkgrel=1
pkgdesc="Find duplicate files on your system"
arch=(any)
url="http://www.hardcoded.net/dupeguru/"
license=('BSD')
depends=('python' 'python-pyqt5' 'libxkbcommon-x11')
makedepends=(
    python-sphinx
)
source=(
    http://download.hardcoded.net/$pkgname-src-$pkgver.tar.gz
)
md5sums=(
    '8f78859b3a18455339e7919fc4d684ce'
)

build() {
  cd "$srcdir"
  python3 -m venv env --system-site-packages
  source env/bin/activate
  python -m pip install --no-index --find-links=deps -r requirements.txt
  source env/bin/activate
  msg "Starting build..."
  python configure.py --edition se
  python build.py --clean
}

package() {
  cd "$srcdir"
  
  python package.py --arch-pkg
  cd "build/${pkgname}-arch"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv ${pkgname}.desktop "${pkgdir}/usr/share/applications"
  
  mkdir -p "$pkgdir/usr/share/${pkgname}"
  cp -a * "$pkgdir/usr/share/${pkgname}/"
  chmod a+x "$pkgdir/usr/share/${pkgname}/run.py"
  
  mkdir -p "$pkgdir/usr/bin"
  ln -s ../share/${pkgname}/run.py "$pkgdir/usr/bin/${pkgname}"
}
