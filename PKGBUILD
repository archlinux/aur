# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: hexchain <i@hexchain.org>
pkgname=python-requirements-parser
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc="A Pip requirements file parser."
arch=('any')
url="https://github.com/madpah/requirements-parser"
license=('Apache-2.0')
depends=('python-future' 'python-setuptools' 'python-types-setuptools')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'https://github.com/madpah/requirements-parser/pull/80.patch'
        'https://github.com/madpah/requirements-parser/pull/82.patch')
sha256sums=('2270c9ed5961de83e37d86332d49954bbab852e36c3f4ff35b431e069baf2c38'
            'b9c3a7c8543b23867452c7564dc5b742e232f6af3cf4abfa524545f9010a6d0a'
            '19351e57470816d95742917efadf9fe2e0dc7224d7f26a76bdb13f3fcfce7019')

prepare() {
  cd "$_name-$pkgver"

  # Add setuptools as a runtime dep for pkg_resources
  patch -Np1 -i ../80.patch

  # fix: only install files in package directory
  patch -Np1 -i ../82.patch
}

build() {
  cd "$_name-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
