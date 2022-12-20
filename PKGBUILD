# Maintainer: David Runge <dvzrv@archlinux.org>

_name=milksnake
pkgname=python-milksnake
# we pin to current HEAD, because upstream is abandonware:
# https://github.com/getsentry/milksnake/issues/28
_commit=ef0723e41df23d8f6357570c69c1e69cb31f9e9e
pkgver=0.1.5.r3.gef0723e
pkgrel=1
pkgdesc="Distribute dynamic linked libraries in Python wheels"
arch=(any)
url="https://github.com/getsentry/milksnake"
license=(Apache)
depends=(python-cffi)
makedepends=(git python-setuptools)
checkdepends=(cargo python-pytest python-virtualenv)
source=(
  "git+https://github.com/getsentry/$_name#commit=$_commit"
  "${pkgname}-0.1.5-distutils.patch"
)
sha512sums=('SKIP'
            'cee83c569881b0c30a31397b43997db6fd32518f34c871714eea0b722ebf974e550c0c40b6bfe3ab7e1dfaddee2d4fbaae31551f51d776337b38a7a26821814d')
b2sums=('SKIP'
        '9c4abaf5623ee3ff2fe15e0f90afe94b9e1a46cfa45d73bb3ee0abd59acd7e030cc1123a3da77f917cbd91ba96bdc278bda8223ac4c7f4c6fb249da3d369937c')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_name"
  # improve distutils build command: https://github.com/getsentry/milksnake/pull/30
  patch -Np1 -i ../${pkgname}-0.1.5-distutils.patch
}

build() {
  cd "$_name"
  python setup.py build
}

check() {
  cd "$_name"
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v -c /dev/null
}

package() {
  cd "$_name"
  python setup.py install --optimize=1 --root="$pkgdir"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
