# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=minijinja
pkgname=(
  minijinja-cli
  python-minijinja
)
pkgver=1.0.12
_commit=5b9917e1262f20d01b1ed78adc1968f8a4e418a3
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

source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

_archive="$pkgbase"

pkgver() {
  cd "$_archive"

  git describe --tags
}

prepare() {
  cd "$_archive"

  sed 's|maturin>=0.15,<0.16|maturin>=0.15|' -i minijinja-py/pyproject.toml

  export RUSTUP_TOOLCHAIN=stable
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features --package minijinja-cli

  cd minijinja-py
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features

  cd minijinja-py

  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  export PYTHONPATH="$PWD/tmp_install/$_site_packages"
  pytest
}

package_minijinja-cli() {
  pkgdesc+=" (CLI utility)"
  depends=(
    gcc-libs
    glibc
  )

  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" target/release/minijinja-cli
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

package_python-minijinja() {
  pkgdesc+=" (Python bindings)"
  depends=(
    gcc-libs
    glibc
    python
    python-markupsafe
  )

  cd "$_archive/minijinja-py"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
