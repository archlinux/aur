# Maintainer: Javier Herrera <javierherrera at posteo dot net>
pkgname=orphan-checker
pkgver=1.0.0
pkgrel=0
epoch=
pkgdesc="Checks if any AUR installed packaged is orphan"
arch=("any")
url="https://gitlab.com/Daklon/orphan-checker"
license=('GPL-v3')
groups=()
depends=(pacman)
makedepends=("rust" "cargo")
checkdepends=()
optdepends=()
provides=("orphan-checker")
source=("$url/-/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
validpgpkeys=()
install=""
conflicts=()
sha256sums=(c22d57bd435b006e84d3e08a2bc30d9aaa53ccf67fc9132e0f282a7bad7604ce)

prepare() {
	find . -mindepth 1 -maxdepth 1 -type d -exec mv {} $pkgname-$pkgver/ \;
	cd "$pkgname-$pkgver" 
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
	cd "$pkgname-$pkgver"
	CFLAGS+=' -ffat-lto-objects'
	cargo build --release --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -Dt "$pkgdir/usr/bin" -m755 target/release/$pkgname
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}


