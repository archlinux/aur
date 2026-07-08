# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=teamtype-git
_pkgname=${pkgname%-git}
pkgver=0.9.2.r0.ge05a267
pkgrel=2
pkgdesc='Peer-to-peer, editor-agnostic collaborative editing of local text files'
arch=(x86_64)
url="https://github.com/$_pkgname/$_pkgname"
license=(AGPL-3.0-only)
depends=(glibc # libc.so libm.so
         libgcc libgcc_s.so
         libgit2 libgit2.so
         zlib)
makedepends=(cargo
             git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
replaces=(ethersync-git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_srcenv() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=true
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	CFLAGS+=' -ffat-lto-objects'
	export LIBGIT2_NO_VENDOR=1
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release
}

check() {
	_srcenv
	cargo test --frozen -p $_pkgname
}

package() {
	cd "$_pkgname/target"
	install -Dm755 -t "$pkgdir/usr/bin/" "release/$_pkgname"
	pushd completions
	install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/" "$_pkgname.bash"
	install -Dm0644 -t "$pkgdir/usr/share/elvish/lib/" "$_pkgname.elv"
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" "$_pkgname.fish"
	# install -Dm0644 -t "$pkgdir/usr/share/nushell/vendor/autoload/" "$_pkgname.nu"
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" "_$_pkgname"
	pushd ../manpages
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" $_pkgname*.1
}
