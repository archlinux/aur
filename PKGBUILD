# Maintainer: witcher <witcher@wiredspace.de>

pkgname="rss-email"
pkgver=0.3.0
pkgrel=1
pkgdesc="Send new RSS posts as E-Mail"
arch=('x86_64')
url="https://sr.ht/~witcher/$pkgname"
license=('WTFPL')
conflicts=('rss-email-git')
depends=('sqlite')
makedepends=('rust' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~witcher/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('64b35be219e7db34e8543928ac119a7de5d5a8121935cd24c9774b22b461de57')

build() {
	cd "$pkgname-$pkgver"

	export CARGO_TARGET_DIR="target"
	cargo build --release --locked

	scdoc < "docs/${pkgname}.1.scd" | gzip > "docs/${pkgname}.1.gz"
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "docs/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
