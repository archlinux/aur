# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Nicholas Novak <34256932+NickyBoy89@users.noreply.github.com>

pkgname=typst-git
_pkgname=${pkgname%-git}
pkgver=0.10.0.r285.g23ec13718
pkgrel=1
epoch=1
pkgdesc='A markup-based typesetting system for the sciences'
arch=(x86_64)
url="https://$_pkgname.app"
_url="https://github.com/$_pkgname/$_pkgname"
license=(Apache)
depends=(gcc-libs
         glibc)
makedepends=(cargo
             git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$_url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/rc.\.//'
}

_srcenv() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
}

build() {
	cd "$_pkgname"
	_srcenv
	CFLAGS+=' -ffat-lto-objects'
	export TYPST_VERSION="${pkgver}"
	export GEN_ARTIFACTS=artifacts/
	cargo build -p typst-cli --frozen --release --all-features
}

check() {
	cd "$_pkgname"
	_srcenv
	cargo test --workspace --frozen --all-features
}

package() {
	cd "$_pkgname"
	local _artifacts='crates/typst-cli/artifacts'
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "$_artifacts/$_pkgname"*.1
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" "$_artifacts/_$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" "$_artifacts/$_pkgname.fish"
	install -Dm0644 "$_artifacts/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}
