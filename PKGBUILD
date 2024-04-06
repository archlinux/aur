# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-cmsis-pack-manager
_name="${pkgname#python-}"
pkgver=0.5.3
pkgrel=3
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
  git+$url.git#tag=v$pkgver
  $pkgname-0.5.3-update_maturin.patch
)
sha512sums=('7ed9d3c5f48134bc89327c6673279c55d06f0e15f26e54ef891ba9c676d661a0730d14808b305a11cf1d1814dfab9d1500461330758a4f9afb17f4e7beac6c8a'
            '429c9c7e408d9fb341291379eb9f716f5d96df12bced88c26ef609647017a1d494701e96c6bd3bf5477a68252329103f5173c9db9fd8705dd7af028bedc6b569')
b2sums=('af608aee7c41ee4abc66ea0cb8d84c43749839440e1f43fd93d20a63aab94871e147463c0564cf811a4de8b73031e522ecbd483962a00588f4fc6b7156276dde'
        'f2b9bf441c6fbdd8e341f4a26f8ae12f6dc0c9fdcc818f3c6cf017ce6fbff90742137fd223a357dc2d372a96d98b32f6c14e561dd001b1e1facbfa58261385b2')

prepare() {
  # https://github.com/pyocd/cmsis-pack-manager/pull/219
  patch -Np1 -d $_name -i ../$pkgname-0.5.3-update_maturin.patch

  cd $_name
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
