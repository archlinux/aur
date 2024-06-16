# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-buildlog-consultant
_name=${pkgname#python-}
pkgver=0.0.37
pkgrel=1
pkgdesc="Build log parser and analyser"
arch=('x86_64')
url="https://github.com/jelmer/buildlog-consultant"
license=('GPL-2.0-or-later')
depends=(
  'python-debian'
  'python-pyaml'
  'python-requirements-parser'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-rust'
  'python-wheel'
)
optdepends=(
  'python-openai'
)
source=("$_name-$pkgver.tar.gz::https://github.com/jelmer/buildlog-consultant/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7de2c2a313b4a92948d7c7dac04f3f586d1df30354e03e88681497c10b06508a')

prepare() {
  cd "$_name-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_name-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
