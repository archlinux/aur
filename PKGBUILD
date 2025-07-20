# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-buildlog-consultant
_name=${pkgname#python-}
pkgver=0.0.39
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
optdepends=('python-openai')
source=("$_name-$pkgver.tar.gz::https://github.com/jelmer/buildlog-consultant/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2bc1fa8245547f7bebcc02cccdcffd4a699c772ce35ac6f78f6fd22da49fa1e3')

prepare() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
