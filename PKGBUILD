# Maintainer: Virgil Dupras <hsoft@hardcoded.net>
pkgname=dupeguru-me
pkgver=6.8.1
pkgrel=1
pkgdesc="Find duplicate songs on your system"
arch=(any)
url="http://www.hardcoded.net/dupeguru_me/"
license=('BSD')
depends=('python' 'python-pyqt5' 'libxkbcommon-x11')
makedepends=(
    python-sphinx
    gcc
)
source=(
    http://download.hardcoded.net/$pkgname-src-$pkgver.tar.gz
)
md5sums=(
    '70b5dd7f258dcdb2584521e03aedb8bd'
)

build() {
  cd "$srcdir"
  python3 -m venv env --system-site-packages
  source env/bin/activate
  python -m pip install --no-index --find-links=deps -r requirements.txt
  msg "Starting build..."
  python configure.py --edition me
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
