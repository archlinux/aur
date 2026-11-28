# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=geoarrow-types
pkgname=python-$_name
pkgver=0.4.1
pkgrel=1
pkgdesc='Minimal GeoArrow type definitions'
arch=('any')
_repo='https://github.com/geoarrow/geoarrow-python'
url="$_repo/tree/main/$_name"
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools'
             'python-setuptools-scm'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pyarrow'
              'python-numpy')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name-$pkgver.tar.gz")
sha256sums=('f70fe26c96409b865e556bd0bbf40f0cd3f8836f29a97d9dfb27eeddbb2366ba')

prepare() {
  cd "geoarrow-python-$_name-$pkgver/$_name"
  # Use the setuptools version shipped by Arch
  sed -i '/^requires = \[/,/\]/s/"\([^"<>=!~ ]*\) *[<>=!~][^"]*"/"\1"/' pyproject.toml
}

build() {
  cd "geoarrow-python-$_name-$pkgver/$_name"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "geoarrow-python-$_name-$pkgver/$_name"
  PYTHONPATH="$PWD/src" pytest "${pytest_options[@]}" tests
}

package() {
  cd "geoarrow-python-$_name-$pkgver/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
