# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Barry Smith <brrtsm at gmail dot com>
# Contributor: Viacheslav Chimishuk <voice@root.ua>

pkgname=python-pysvn
pkgver=1.9.13
_pycxxver=7.1.5
pkgrel=1
pkgdesc="The Pythonic interface to Subversion"
url="https://pysvn.sourceforge.io/"
depends=('python>=3.1.3' 'subversion' 'apr')
conflicts=('pysvn<=1.7.4-3')
arch=('i686' 'x86_64')
license=('Apache')
source=("https://downloads.sourceforge.net/project/pysvn/pysvn/V${pkgver}/pysvn-${pkgver}.tar.gz"
        "fake_svnversion.sh")
sha256sums=('3ce1fad1dfb770d535a8364731a399d52a5a5d8d7fc76b1a7ed01ecdad3b9ca2'
            '169b1579568954cf3b394d3fe8e6b7515b7c51e55f7584a8151a8efc614124ec')

build() {
  cd "$srcdir/pysvn-$pkgver/Source"
  export WC_SVNVERSION="$srcdir/fake_svnversion.sh"
  python3 setup.py configure --norpath --verbose --pycxx-dir="../Import/pycxx-${_pycxxver}"
  make
}

check() {
  cd "$srcdir/pysvn-$pkgver/Tests"
  LC_ALL="en_US.UTF-8" make
}

package() {
  _pyver=$(python -c 'import sys; print(sys.version_info.minor)')
  cd "$srcdir/pysvn-$pkgver/Source"
  install -Ddm755 "$pkgdir/usr/lib/python3.${_pyver}/site-packages/pysvn/"
  install -Dm644 pysvn/__init__.py "$pkgdir/usr/lib/python3.${_pyver}/site-packages/pysvn/__init__.py"
  install -Dm755 "pysvn/_pysvn_3_${_pyver}.so" "$pkgdir/usr/lib/python3.${_pyver}/site-packages/pysvn/_pysvn_3_${_pyver}.so"
}
# vim: set ts=2 sw=2 et:
