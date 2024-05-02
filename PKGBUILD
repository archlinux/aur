# Maintainer: Javier Herrera <javierherrera at posteo dot net>
pkgname=orphan-checker
pkgver=1.2.0
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
sha512sums=(9cd0b5a9e3ec5f5dbb1a4b88300ef93895140e7488942e0930b9f5eefda71129659ee4cf4c6f10d967c628100be3ad28ed9c2341bf6ad2fd4652bf9abc59947a
	    6e80c2e91f74624a57bca2817b3aacde14521f03963c5bbefefb4a84bbbc162ad4cbe8bd91c325762762908e51be172aa9969a54268c195b9ab0ba777c4f6970)

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


