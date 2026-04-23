# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-cmsis-pack-manager
_name=cmsis_pack_manager
pkgver=0.6.0
pkgrel=1
pkgdesc="A Rust and Python module for handling CMSIS Pack files"
arch=($CARCH)
url="https://github.com/pyocd/cmsis-pack-manager"
license=(Apache-2.0)
depends=(
  glibc
  libgcc
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
  "${_name}::git+$url.git#tag=v${pkgver}"
)
sha512sums=('1e5c29781e0b61a8ef3412316ef9f8dcf421c211208e0cf4dd15b186b046964865c58f0e8df2db83ee1b313029992a0179c62abae1bf042aa795f17d1b287551')

prepare() {
  # https://github.com/pyocd/cmsis-pack-manager/pull/219
  git -C "${srcdir}/${_name}" clean -dfx
  # cd $_name
  # git tag -l 'rust*' | xargs git tag -d
}

# pkgver() {
#   cd "${srcdir}/${_name}"
#   (
#     set -o pipefail
#     git describe --long --tag --match='v*' --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
#       printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
#   )
# }

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
