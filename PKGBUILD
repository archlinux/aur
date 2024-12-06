# Maintainer: Matthieu Monsch <mtth at apache dot org>

pkgname=netstate
pkgver=0.2.0
pkgrel=2
pkgdesc='Run hooks on network state changes'
arch=(x86_64)
url=https://github.com/mtth/netstate
license=(MIT)

makedepends=(asciidoctor cargo)

source=(
	"$pkgname-v$pkgver.tar.gz::https://github.com/mtth/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	netstate.service
)
sha256sums=('6ee800ea6a4ca5370b5b0a43f32817603e0fbb3c1349e0443a5627765f22d8d7'
            '9e38cef1b0feced1aafbb233eaa6c46409609c63752226f9322349ba2f4bbbc1')

prepare() {
	mv "$pkgname-$pkgver"/* . # GitHub archives are nested
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	export \
		RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target \
		NETSTATE_VERSION="$pkgver"
	cargo build --frozen --release --all-features

	asciidoctor -b manpage -a manversion="$pkgver" "docs/$pkgname.adoc" -o - \
		| gzip -9 >"$pkgname.1.gz"
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" netstate.service
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/man/man1" $pkgname.1.gz
}
