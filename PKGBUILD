# Maintainer: Matthieu Monsch <mtth at apache dot org>

pkgname=netstate
pkgver=0.4.0
pkgrel=4
pkgdesc='Run hooks on network state changes'
arch=(x86_64)
url=https://github.com/mtth/netstate
license=(MIT)

makedepends=(asciidoctor cargo)

source=(
	"$pkgname-v$pkgver.tar.gz::https://github.com/mtth/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	netstate.service
)
sha256sums=('47dace714a0d3c5c3dc0eafd39fbfaaed9fd89ae5f0f29c116309d1e134730b0'
            '9e38cef1b0feced1aafbb233eaa6c46409609c63752226f9322349ba2f4bbbc1')

_sourcedir="$pkgname-$pkgver" # GitHub archives are nested

prepare() {
	cd "$_sourcedir"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_sourcedir"
	export \
			RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target \
			NETSTATE_VERSION="$pkgver"
	cargo build --frozen --release --all-features
	asciidoctor -b manpage -a manversion="$pkgver" "docs/$pkgname.adoc" -o - |
		gzip -9 >"$pkgname.1.gz"
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_sourcedir/target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "$_sourcedir/LICENSE"
	install -Dm0644 -t "$pkgdir/usr/share/man/man1" "$_sourcedir/$pkgname.1.gz"
	install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" netstate.service
}
