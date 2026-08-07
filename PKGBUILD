# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=youki
pkgver=0.7.0
pkgrel=1
pkgdesc='A container runtime written in Rust'
arch=(x86_64 aarch64)
url="https://containers.github.io/$pkgname"
license=(Apache-2.0)
depends=(glibc # libc.so libm.so ld-linux-x86-64.so
         libgcc libgcc_s.so
         libseccomp libseccomp.so
         dbus)
makedepends=(cargo
             git
             dbus-glib
             systemd)
optdepends=('docker: run via docker'
            'podman: run via podman')
source=("git+https://github.com/containers/youki.git#tag=v$pkgver")
sha256sums=('2dbc7be5edccd269fcce7f1509294bb056764cceaea3e64608476e8a2eb13c31')

_srcenv() {
	cd "$pkgname"
	export CARGO_HOME="$srcdir"
	export CARGO_PROFILE_RELEASE_DEBUG=2
	export CARGO_PROFILE_RELEASE_STRIP=false
	export CARGO_PROFILE_RELEASE_LTO=thin
	export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
	export CARGO_PROFILE_RELEASE_OPT_LEVEL=3
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=' -ffat-lto-objects'
}

prepare() {
	_srcenv
	cargo fetch --locked --target host-tuple
}

build() {
	_srcenv
	cargo build --frozen --release --bin youki
}

_compgen() {
	cd "$pkgname"
	./target/release/$pkgname completion --shell $1
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 <(_compgen bash) "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm0644 <(_compgen fish) "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
	install -Dm0644 <(_compgen zsh)  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
