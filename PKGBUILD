# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-calmjs
_name="${pkgname#python-}"
pkgver=3.4.4
pkgrel=4
pkgdesc="Framework for building toolchains and utilities for working with the JavaScript/Node.js ecosystem"
arch=(any)
url="https://github.com/calmjs/calmjs"
license=(GPL-2.0-or-later)
depends=(
  python
  python-calmjs.parse
  python-calmjs.types
  python-setuptools
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "fix-tests-python-3.13.patch"
)
sha512sums=('eb70d2d57b7d3cf22134f80c8c47b443893419e4f052b39102b04938b55c8afb950b6154f929a1a6cb74c2e67ae34ecf757b7b5765c47e9a74b805659eb6f22c'
            'bc9ef2466f649a1240b7b452b2abbaec3e6f6dd4bc39aac8e1c4d7c91d6a441786366b53f9a2184446f419d90a26d6ac8eca528d274fb307308338fb0749ec7f')
b2sums=('51ee6b24eaf59259140b9cbf3ba8a713b19934659688c02529cb8b4946ac7628b3bd07e8e4025d368f12db1eebaff41939e8b18ec3843938129d0943d4400216'
        '7399b63b4f98071283728dfdb9b715d3743507c67dfae0e8b005e1312079a09b02ff4b1014039bdc0d34cef6c6328f86c04f093e4fef39eeb3e2114c4dd43f9a')

prepare() {
  cd $_name-$pkgver
  patch -Np1 -i ../fix-tests-python-3.13.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  python -m unittest discover -vs src/$_name/tests/
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
