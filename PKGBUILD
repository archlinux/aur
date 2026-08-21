# Maintainer: ItzTas <ts.aur@imts.aleeas.com>

pkgname=luadot
pkgver=0.1.0
pkgrel=1
pkgdesc='A dotfiles manager configured in Lua'
arch=('x86_64' 'aarch64')
url='https://github.com/ItzTas/luadot'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'cmake')
options=('!lto')
_registry='https://gitlab.digitalventura.com.br/api/v4/projects/luadot%2Fluadot/packages/generic/luadot'
_version=0.1.0
_srcdir="luadot-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$_registry/$_version/luadot-$pkgver-src.tar.gz")
sha256sums=('0777c8ea25f2e333cf27593d811d80c1bdfcbcb43024f658f68f69054838f664')

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
	install -Dm0755 target/release/luadot "$pkgdir/usr/bin/luadot"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 vendor/lpeg/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.lpeg"

	install -d "$pkgdir/usr/share/bash-completion/completions"
	install -d "$pkgdir/usr/share/zsh/site-functions"
	install -d "$pkgdir/usr/share/fish/vendor_completions.d"

	target/release/luadot completions bash >"$pkgdir/usr/share/bash-completion/completions/luadot"
	target/release/luadot completions zsh >"$pkgdir/usr/share/zsh/site-functions/_luadot"
	target/release/luadot completions fish >"$pkgdir/usr/share/fish/vendor_completions.d/luadot.fish"
}
