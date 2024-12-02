# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-cmsis-pack-manager
_name="${pkgname#python-}"
pkgver=0.5.3.r21.ga312ce0
pkgrel=1
pkgdesc="A Rust and Python module for handling CMSIS Pack files"
arch=(x86_64)
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

prepare() {
  # https://github.com/pyocd/cmsis-pack-manager/pull/219
  #   patch -Np1 -d $_name -i ../$pkgname-0.5.3-update_maturin.patch
  git -C "${srcdir}/${_name}" clean -dfx
  cd $_name
  git tag -l 'rust*' | xargs git tag -d
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
  cd "${srcdir}/${_name}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
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

  cd $_name
  python -m build "${python_build_options[@]}"
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
