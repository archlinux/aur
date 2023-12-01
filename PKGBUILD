# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cmsis-pack-manager
pkgname=python-cmsis-pack-manager
pkgver=0.5.3
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
  $url/archive/v$pkgver/$_name-v$pkgver.tar.gz
  $pkgname-0.5.3-update_maturin.patch
)
sha512sums=('117b4063c4560c9685f6236175d52e44e8fc9eee61a4ea27fd9e3fb7045d22ffb0a5bea3544d7c9740e20c4be3b7b924c32c076b09c27f5da912f179cba2f8fc'
            '429c9c7e408d9fb341291379eb9f716f5d96df12bced88c26ef609647017a1d494701e96c6bd3bf5477a68252329103f5173c9db9fd8705dd7af028bedc6b569')
b2sums=('c623027d77f85957bd0328b8fbaa278d93445edd47f480da1aa7738b4047e9728411a2b8b9963ad6c3a53a85307fd935760b63fab384e7eb490f84fa9511ab5a'
        'f2b9bf441c6fbdd8e341f4a26f8ae12f6dc0c9fdcc818f3c6cf017ce6fbff90742137fd223a357dc2d372a96d98b32f6c14e561dd001b1e1facbfa58261385b2')

prepare() {
  # https://github.com/pyocd/cmsis-pack-manager/pull/219
  patch -Np1 -d $_name-$pkgver -i ../$pkgname-0.5.3-update_maturin.patch

  cd $_name-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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

  cd $_name-$pkgver
  python -m build "${python_build_options[@]}"
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
