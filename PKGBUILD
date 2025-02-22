# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-cmsis-pack-manager
_name=cmsis_pack_manager
pkgver=0.5.3.r35.g9f1a17a
pkgrel=1
pkgdesc="A Rust and Python module for handling CMSIS Pack files"
arch=(any)
url="https://github.com/pyocd/cmsis-pack-manager"
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
  python
  python-appdirs
  python-cffi
  python-pyyaml
)
makedepends=(
  cbindgen
  git
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
source=(
  "${_name}::git+$url.git"
)
sha512sums=('SKIP')
# source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
# sha512sums=('d6f35f33917fd906d5b78a8f66891222f409d0e42f602f93de49dd87e9fc16c602f9eb63e529db8e68546a4b38d6f1f91e4456e238b3b8d149d19c822f238394')

prepare() {
  # https://github.com/pyocd/cmsis-pack-manager/pull/219
  #   patch -Np1 -d $_name -i ../$pkgname-0.5.3-update_maturin.patch
  git -C "${srcdir}/${_name}" clean -dfx
  cd $_name
  git tag -l 'rust*' | xargs git tag -d
}

pkgver() {
  cd "${srcdir}/${_name}"
  (
    set -o pipefail
    git describe --long --tag --match='v*' --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  local python_build_options=(
    --wheel
    --no-isolation
    -C"--target=$CARCH-unknown-linux-gnu"
    -C"--locked"
    -C"--release"
    -C"--all-features"
    -C"--strip"
  )
  cd "${srcdir}/${_name}"
  python -m build "${python_build_options[@]}"
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_name}"
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd "${srcdir}/${_name}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# build() {
#   local python_build_options=(
#     --wheel
#     --no-isolation
#     -C"--target=$CARCH-unknown-linux-gnu"
#     -C"--locked"
#     -C"--release"
#     -C"--all-features"
#     -C"--strip"
#   )
#   cd "${srcdir}/${_name}-${pkgver}"
#   python -m build "${python_build_options[@]}"
# }
#
# check() {
#   local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#
#   cd "${srcdir}/${_name}-${pkgver}"
#   python -m installer --destdir=test_dir dist/*.whl
#   export PYTHONPATH="$PWD/test_dir/$_site_packages:$PYTHONPATH"
#   pytest -vv
# }
#
# package() {
#   cd "${srcdir}/${_name}-${pkgver}"
#   python -m installer --destdir="$pkgdir" dist/*.whl
# }
