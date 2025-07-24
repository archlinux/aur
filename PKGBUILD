# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgbase=minijinja
pkgname=(
  minijinja-cli
  python-minijinja
)
pkgver=2.11.0
pkgrel=1
pkgdesc="A powerful but minimal dependency template engine for Rust compatible with Jinja/Jinja2"
url="https://github.com/mitsuhiko/minijinja"
arch=(x86_64)
license=(Apache-2.0)
makedepends=(
  cargo
  git
  python-build
  python-installer
  python-markupsafe
  python-maturin
  python-wheel
)
checkdepends=(python-pytest)
source=("git+$url.git#tag=$pkgver")
sha256sums=('8819f0084d64809ed4ce1cf15ffc6ba8260c9e3c636cb906c46107253948cca4')

prepare() {
  cd $pkgbase
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgbase
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features --package minijinja-cli

  cd minijinja-py
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $pkgbase
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features

  cd minijinja-py
  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest
}

package_minijinja-cli() {
  pkgdesc+=" (CLI utility)"
  depends=(
    gcc-libs
    glibc
  )

  cd $pkgbase
  install -vDm755 -t "$pkgdir/usr/bin" target/release/minijinja-cli
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

package_python-minijinja() {
  pkgdesc+=" (Python bindings)"
  depends=(
    gcc-libs
    glibc
    python
    python-markupsafe
  )

  cd $pkgbase/minijinja-py
  python -m installer --destdir="$pkgdir" dist/*.whl
}
