# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pythonfinder
pkgname=python-pythonfinder
pkgver=2.0.5
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
  $pkgname-2.0.5-pydantic2.patch
)
sha512sums=('f4c10077cb7b5d510d5fca2d5bbdcb1159dfa956a48f474efd3279ee8146ccd436c0a86caa035f98087ef051cd1ac74c0681fe14174db64024716c6d299f8fe6'
            '9ffd2fc9bcee03379e5c7c804429148be0f4a7a2066959bbe13a8bcb79be4ef61ae4ad43561f26bda9c67b5f17999cd4b1cddde82feadd98b85c6f90239eff8f')
b2sums=('e3dd790e11083d177faea4eb7252dfc6ea2ab9630cb846723e941c2364f6283448d39d7fd874c0a0f758d8aafad8f4bc158a4351aed991b801782b6dedebd3cb'
        '4ec3830893da511497d69003f8857eef3d38daafe37b422ba5fff4113db0fab89b21a1a8d58bdae7de687ce0ed5bb747c5e634d5cef0458b797406cfcf3a70d5')

prepare() {
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-2.0.5-pydantic2.patch
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
