# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cmsis-pack-manager
pkgname=python-cmsis-pack-manager
pkgver=0.5.2
pkgrel=2
pkgdesc="A Rust and Python module for handling CMSIS Pack files"
arch=(x86_64)
url="https://github.com/pyocd/cmsis-pack-manager"
license=(Apache)
depends=(
  gcc-libs
  glibc
  python
  python-appdirs
  python-cffi
  python-pyyaml
)
makedepends=(
  python-build
  python-installer
  python-maturin
  python-wheel
  rust
)
checkdepends=(
  python-hypothesis
  python-jinja
  python-pytest
)
# disable LTO until ring can be built with it: https://github.com/briansmith/ring/issues/1444
options=(!lto)
# NOTE: sdist tarball broken and upstream doesn't react at all: https://github.com/pyocd/cmsis-pack-manager/issues/207
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=($url/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('3ce4824f9de3390d24fc031b5ba9304ab056ce488df3ba355c3fa2b5abe495269da2e4e4cf85ba3d5a577fce930b8da2deae8309e5fb6f9d997989b7f84d23c5')
b2sums=('059b57ad539b815476212184f16508595ab67bd6a0cc0540795ce1f5b8341bc2f94d3519fe42b3281dca8f25bb0cb368e8483c6172d4dd365b72754a4e1dc7cf')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
