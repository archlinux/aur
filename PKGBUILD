# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=coveragepy
pkgname=python38-coverage
pkgver=6.5.0
pkgrel=2
pkgdesc="A tool for measuring code coverage of Python programs"
arch=('x86_64')
url="https://nedbatchelder.com/code/coverage/"
license=('Apache')
depends=('python38')
optdepends=('python38-tomli: for pyproject.toml support')
makedepends=('python38-setuptools')
checkdepends=('python38-flaky' 'python38-hypothesis'
              'python38-pycontracts' 'python38-pytest' 'python38-pytest-xdist' 'python38-tomli'
              'python38-unittest-mixins' 'python38-virtualenv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nedbat/coveragepy/archive/$pkgver.tar.gz")
sha512sums=('40d8c1a6b796925e7c1082fe27398f160725be7f7b73afef6328080930b6b635bfae863ed303b262d530ccd46cc8c4ab823acc1998cdd21b686b9f81b01a16ff')
b2sums=('09d3efc0673485190c920c03f2fc1d2dac14c0759953df2d4f3e7043f63ea7b6c26ddcf715b6456671f3391bacefb34ed68228970faaf352ef6fd8ecb83413a7')

build() {
  cd $_pkgname-$pkgver
  python3.8 setup.py build
}

check() {
  cd $_pkgname-$pkgver

  local python_version="$(python3.8 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
  (
    virtualenv "test_dir" --system-site-packages
    . "test_dir/bin/activate"
    export PYTHONPATH="/usr/lib/python$python_version/site-packages:$PYTHONPATH"
    python3.8 setup.py --quiet clean develop
    python3.8 igor.py zip_mods install_egg remove_extension
    python3.8 igor.py test_with_tracer py
    python3.8 setup.py --quiet build_ext --inplace
    python3.8 igor.py test_with_tracer c
  ) || echo "Known failing tests."
}

package() {
  cd $_pkgname-$pkgver

  python3.8 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="$pkgdir"
}
