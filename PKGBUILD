# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ognibuild
pkgver=0.0.22
pkgrel=1
pkgdesc="Detect and invoke build systems"
arch=('x86_64')
url="https://github.com/jelmer/ognibuild"
license=('GPL-2.0-or-later')
depends=(
  'breezy'
  'python-buildlog-consultant'
  'python-requirements-parser'
  'python-ruamel-yaml'
  'python-setuptools'
  'python-toml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools-rust'
  'python-wheel'
)
optdepends=(
  'python-aiohttp-openmetrics'
  'python-apt'
#  'python-brz-debian'
  'python-debian'
  'python-debmutate'
  'python-lz4'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e8bf7304a5a3fec55388f65f0a156e58ab895a26d041a74cd942e4146753436a')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
