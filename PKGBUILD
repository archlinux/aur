# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=fuc
pkgver=2.2.0
pkgrel=1
pkgdesc="Modern, performance focused unix commands"
arch=('x86_64')
url="https://github.com/SUPERCILEX/fuc"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SUPERCILEX/fuc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d0444f67311408ecbcc51a8df120e711c2736a3b82186f33e5df7b12a6b9fc88')

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
