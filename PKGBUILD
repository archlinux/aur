# Maintainer: ItzTas <ts.aur@imts.aleeas.com>

pkgname=luadot-nightly
_pkgname=luadot
pkgver=0.1.0.nightly.3
pkgrel=1
pkgdesc='A dotfiles manager configured in Lua (nightly)'
arch=('x86_64' 'aarch64')
url='https://github.com/ItzTas/luadot'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!lto')
_tag='v0.1.0-nightly.3'
_srcdir="$_pkgname-${_tag#v}"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('5729f7b877705ccc94a312b6ec814dcc63f9d32fcbb8e942424cd73f2108f817')

prepare() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$_srcdir"
	install -Dm0755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -d "$pkgdir/usr/share/bash-completion/completions"
	install -d "$pkgdir/usr/share/zsh/site-functions"
	install -d "$pkgdir/usr/share/fish/vendor_completions.d"

	"target/release/$_pkgname" completions bash >"$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"target/release/$_pkgname" completions zsh >"$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
	"target/release/$_pkgname" completions fish >"$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
