# Maintainer: Tonik <toni[at]kukec[dot]dev>

pkgname=python-libdebug
pkgver=0.9.0
_srcname="${pkgname/python-/}"
_srcdir="$_srcname-$pkgver"
pkgrel=1
pkgdesc="A Python library for the debugging of binary executables."
arch=('x86_64')
url="https://github.com/libdebug/libdebug"
license=('MIT')
depends=(
  gcc-libs
  glibc
  libdwarf
  libelf
  python
  python-prompt_toolkit
  python-psutil
  python-pyelftools
  python-requests
  python-rich
)
makedepends=(
  nanobind
  python-build
  python-installer
  python-scikit-build-core
  python-typing_extensions
)
checkdepends=(
  python-pwntools
  python-objgraph
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('ff5ad792bf2006acc8ad35bb2796faedcb0cdce1f5bca2b93ac535b921a821efa869e4910fd529958b424f62d6ace8c63ea239152fa0632233233d398b381381')

build() {
  cd $_srcdir
  python3 -m build --wheel --no-isolation
}

package() {
  cd $_srcdir
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

check() {
  cd $_srcdir
  _temp_dir=$(mktemp -d)
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir="$_temp_dir" dist/*.whl
  export PYTHONPATH="$_temp_dir/$_site_packages:$PYTHONPATH"

  cd test
  python run_suite.py
  trap 'rm -rf "$_temp_dir"' EXIT
}
