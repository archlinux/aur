# Maintainer: witcher <witcher@wiredspace.de>

_name="rss-email"
pkgname="${_name}-git"
pkgver=0.4.0.r1.g56324d7
pkgrel=1
pkgdesc="Send new RSS/Atom posts as email"
arch=('x86_64')
url="https://sr.ht/~witcher/${_name}"
license=('WTFPL')
conflicts=('rss-email')
depends=('sqlite')
makedepends=('rust' 'scdoc')
source=("$pkgname::git+https://git.sr.ht/~witcher/${_name}")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"

	export CARGO_TARGET_DIR="target"
	cargo build --release --locked

	scdoc < "docs/${_name}.1.scd" | gzip > "docs/${_name}.1.gz"
	scdoc < "docs/${_name}.5.scd" | gzip > "docs/${_name}.5.gz"
}

package() {
	cd "$pkgname"

	install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${_name}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${_name}" "LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/man/man1" "docs/${_name}.1.gz"
	install -Dm644 -t "${pkgdir}/usr/share/man/man5" "docs/${_name}.5.gz"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${_name}" "README.md" "config.example.toml"
}
