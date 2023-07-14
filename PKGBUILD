# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pythonfinder
pkgname=python-pythonfinder
pkgver=2.0.4
pkgrel=2
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
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
  $pkgname-2.0.4-pydantic2.patch
)
sha512sums=('90ca5bb183b01ffeb92e15404433aa4908ee678240b12a4d977acbd064e1992cca0760f41f1dcc7f77b93fa0a2cd3057c3f24d7fec7d7bb2fdec231213af8626'
            '339447efba9208721322500fd18d13fb05210533558be906f7272bf1e739a6805342b04bc5bb39e468cfc55846340a513c07a088ee1bd6b2c2e15cde2d4c0e2b')
b2sums=('2a590a9c24064267e5b47137b7d60129b17d9c02e560530797a8f8ecef2c3dc9169617d3eeadc6f99aead080dd50718daf63518eba6759480a1f015aeb8e54a1'
        '0aac8d86d0a9fd196326ecbb85881f9e2d69da2007050a5cdf467c1c60bc200248cd9d3c56e4826821bd0f68a8bee30108ba7bb17a7ca9b0db5807d6526b5904')

prepare() {
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-2.0.4-pydantic2.patch
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
