# Maintainer: Carlos Prieto Ortiz <prietus@live.com>
pkgname=irkt-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern terminal IRC client: full IRCv3, SASL/CertFP, inline images (Kitty/iTerm2/Sixel)"
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/irkt"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('irkt')
conflicts=('irkt' 'irkt-bin')
source=("$pkgname::git+https://github.com/prietus/irkt.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	if git describe --long --tags >/dev/null 2>&1; then
		git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --release
}

package() {
	cd "$pkgname"
	install -Dm0755 target/release/irkt "$pkgdir/usr/bin/irkt"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
