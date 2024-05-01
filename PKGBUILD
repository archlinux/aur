# Maintainer: Javier Herrera <javierherrera at posteo dot net>
pkgname=orphan-checker
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="Checks if any AUR installed packaged is orphan"
arch=("any")
url="https://gitlab.com/Daklon/orphan-checker"
license=('AGPL-3.0-or-later')
groups=()
depends=(pacman)
makedepends=("rust" "cargo")
checkdepends=()
optdepends=()
provides=("orphan-checker")
source=("$url/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
	"$url/-/releases/v${pkgver}/downloads/${pkgname}-v${pkgver}.tar.gz.asc")
validpgpkeys=('1093631AE70F27075947C8DEC47377D56A22D749')
install=""
conflicts=()
sha512sums=(adb1c1a999b077e48890ddb0bb41544a39903f03ff88968c4a4058060ca7ffa70bc2162932ce292c85696634c89a91eabef9b996fa223b60719055767e20406b
	    654e69fc1bb7cd26b6d4d9801d2ef5d5792eaab54d703605ee21a20b834d4cc548f117b21f6871115977ae1edad7eb6ec7f3269182c32f3b6e5e3af35ff03504)

prepare() {
	cd "$pkgname-v$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
	cd "$pkgname-v$pkgver"
	CFLAGS+=' -ffat-lto-objects'
	cargo build --release --frozen
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dt "$pkgdir/usr/bin" -m755 target/release/$pkgname
	install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}


