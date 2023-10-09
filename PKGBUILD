# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=fuc
pkgver=1.1.9
pkgrel=1
pkgdesc="Modern, performance focused unix commands"
arch=('x86_64')
url="https://github.com/SUPERCILEX/fuc"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SUPERCILEX/fuc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5301e4634b8de57d1afb4111b0623f2c3967f9a160a043914f0fa400a77dfbc3')

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
		install -D -m 0755 -t "${pkgdir}/usr/bin/" "target/release/${_command}"
	done
}
