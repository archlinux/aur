# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=fuc
pkgver=1.1.6
pkgrel=2
pkgdesc="Modern, performance focused unix commands"
arch=('x86_64')
url="https://github.com/SUPERCILEX/fuc"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo-nightly')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SUPERCILEX/fuc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('94be9005ea08a2b1cd2d5732df47abad7e4ca68b864fb832f8bd47e42cd2f5fd')

_commands=('cpz' 'rmz')

prepare() {
	cd "$pkgname-$pkgver"
	for _command in ${_commands[@]}; do
		cargo fetch --locked --target "$CARCH-unknown-linux-gnu" --manifest-path "${_command}/Cargo.toml"
	done
}

build() {
	cd "$pkgname-$pkgver"
	for _command in ${_commands[@]}; do
		cargo build --release --frozen --manifest-path "${_command}/Cargo.toml"
	done
}

check() {
	cd "$pkgname-$pkgver"
	for _command in ${_commands[@]}; do
		cargo test --release --frozen --manifest-path "${_command}/Cargo.toml"
	done
}

package() {
	cd "$pkgname-$pkgver"
	for _command in ${_commands[@]}; do
		cargo install --locked --no-track --root "$pkgdir/usr/" --path "$_command"
	done
}
