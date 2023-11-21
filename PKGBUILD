# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pythonfinder
pkgname=python-pythonfinder
pkgver=2.0.6
pkgrel=1
pkgdesc="Cross Platform Search Tool for Finding Pythons"
arch=(any)
url="https://github.com/sarugaku/pythonfinder"
license=(MIT)
depends=(
  python
  python-cached-property
  python-packaging
  python-pydantic
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  git
  python-click
  python-pytest
)
optdepends=('python-click: for CLI')
source=(
  $_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
  $pkgname-2.0.6-pydantic2.patch
)
sha512sums=('046fcf19f5d94841498a23ae5600aec48bc938f04a8c08b57e6e7e055b687220068d65e42a30a603586f112c2bd2306ae683be151af7a10763e76e22daab1b43'
            '5b84a1eb6877370366b10839d175ea99c6cb806f8ec0df8df26f8794469529b7221deb7e91a0b7c66161a63ceb760c8c01026eab97541ef05f43cec1a75b86c1')
b2sums=('63589860ac1432a5c47f1124bf89349858e44960b0f53c0aa3c14b3d4a723bc558db46b8e27b186c1935ef9a590b4b9a352432030dfb6f659bcd76100744f56f'
        '36fc245448097a1435f110b3d44c7de68647bda3ede15cc6965da581b966ebdcd0d5bcdc5aae409fe5af5ecd6b1ff8dd7b969f977bb1d7f90b0a80a686fcf7bb')

prepare() {
  # upstream wants to drop pydantic, so meanwhile stuff is broken...
  # https://github.com/sarugaku/pythonfinder/issues/142
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-2.0.6-pydantic2.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv -c /dev/null
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
