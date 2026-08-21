# Maintainer: ItzTas <ts.aur@imts.aleeas.com>

pkgname=luadot-nightly
_pkgname=luadot
pkgver=0.1.0.nightly.8
pkgrel=1
pkgdesc='A dotfiles manager configured in Lua (nightly)'
arch=('x86_64' 'aarch64')
url='https://github.com/ItzTas/luadot'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!lto' '!debug')
_registry='https://gitlab.digitalventura.com.br/api/v4/projects/luadot%2Fluadot/packages/generic/luadot'
_version=0.1.0-nightly.8
_srcdir="$_pkgname-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$_registry/$_version/$_pkgname-$pkgver-src.tar.gz")
sha256sums=('7b17690ba070b952e2722b434b0a2ca099ed7165f8bf94a40059166670944825')

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
	install -Dm0644 vendor/lpeg/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.lpeg"

	install -d "$pkgdir/usr/share/bash-completion/completions"
	install -d "$pkgdir/usr/share/zsh/site-functions"
	install -d "$pkgdir/usr/share/fish/vendor_completions.d"

	"target/release/$_pkgname" completions bash >"$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"target/release/$_pkgname" completions zsh >"$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
	"target/release/$_pkgname" completions fish >"$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"

	install -d "$pkgdir/usr/share/man/man1"
	"target/release/$_pkgname" man >"$pkgdir/usr/share/man/man1/$_pkgname.1"
}
