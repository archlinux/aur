# Maintainer: witcher <witcher@wiredspace.de>

pkgname="rss-email"
pkgver=0.4.1
pkgrel=1
pkgdesc="Send new RSS/Atom posts as email"
arch=('x86_64')
url="https://sr.ht/~witcher/$pkgname"
license=('WTFPL')
conflicts=('rss-email-git')
depends=('sqlite')
makedepends=('rust' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~witcher/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d8300c569d0b326e854bed2aa9c53e960bbba2b3ea56cb94c5e0e07c50178221')

build() {
	cd "$pkgname-$pkgver"

	export CARGO_TARGET_DIR="target"
	cargo build --release --locked

	scdoc < "docs/${pkgname}.1.scd" | gzip > "docs/${pkgname}.1.gz"
	scdoc < "docs/${pkgname}.5.scd" | gzip > "docs/${pkgname}.5.gz"
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/man/man1" "docs/${pkgname}.1.gz"
	install -Dm644 -t "${pkgdir}/usr/share/man/man5" "docs/${pkgname}.5.gz"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md" "config.example.toml"
}
