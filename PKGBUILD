# Maintainer: Virgil Dupras <hsoft@hardcoded.net>
pkgname=dupeguru-pe
pkgver=2.10.1
pkgrel=1
pkgdesc="Find duplicate pictures on your system"
arch=(i686 x86_64)
url="http://www.hardcoded.net/dupeguru_pe/"
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
    '6b3da615e7ab7270d1df4cf7c165d6c1'
)

build() {
  cd "$srcdir"
  python3 -m venv env --system-site-packages
  source env/bin/activate
  python -m pip install --no-index --find-links=deps -r requirements.txt
  source env/bin/activate
  msg "Starting build..."
  python configure.py --edition pe
  python build.py --clean
}

package() {
  cd "$srcdir"
  
  python package.py
  cd "build/${pkgname}-arch"

  mkdir -p "${pkgdir}/usr/share/applications"
  mv ${pkgname}.desktop "${pkgdir}/usr/share/applications"
  
  mkdir -p "$pkgdir/usr/share/${pkgname}"
  cp -a * "$pkgdir/usr/share/${pkgname}/"
  chmod a+x "$pkgdir/usr/share/${pkgname}/run.py"
  
  mkdir -p "$pkgdir/usr/bin"
  ln -s ../share/${pkgname}/run.py "$pkgdir/usr/bin/${pkgname}"
}
