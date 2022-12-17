# Maintainer: witcher <witcher@wiredspace.de>

_name="rss-email"
pkgname="${_name}-git"
pkgver=0.3.0.r10.g82082a7
pkgrel=1
pkgdesc="Send new RSS posts as email"
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

	install -Dm755 "target/release/${_name}" "${pkgdir}/usr/bin/${_name}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
	install -Dm644 "docs/${_name}.1.gz" "${pkgdir}/usr/share/man/man1/${_name}.1.gz"
	install -Dm644 "docs/${_name}.5.gz" "${pkgdir}/usr/share/man/man5/${_name}.5.gz"
	install -Dm644 "config.example.toml" "${pkgdir}/usr/share/doc/rss-email/config.example.toml"
}
