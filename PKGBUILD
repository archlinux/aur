# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=fuc
pkgver=3.1.0
pkgrel=1
pkgdesc="Modern, performance focused unix commands"
arch=('x86_64')
url="https://github.com/SUPERCILEX/fuc"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SUPERCILEX/fuc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cfc1faaec08e7b2a5aec124abea12a8779cf7c2da937931964112210d2bdb576')

_commands=('cpz' 'rmz')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	# Yeah, right
	export RUSTC_BOOTSTRAP=1
}

build() {
	cd "$pkgname-$pkgver"
	cargo build "${_commands[@]/#/--package=}" --release --frozen --bins --tests
}

check() {
	cd "$pkgname-$pkgver"
	cargo test "${_commands[@]/#/--package=}" --release --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 \
		"${_commands[@]/#/"target/release/"}" \
		-t "$pkgdir/usr/bin"
}
