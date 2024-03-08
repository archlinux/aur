# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-server"
pkgver=0.14.3
pkgrel=1
pkgdesc="Pass-it-on server component"
arch=("any")
license=("MIT")
url="https://github.com/kwheelans/pass-it-on"
conflicts=("pass-it-on-server-bin")
depends=("openssl" "sqlite")
makedepends=("cargo")
source=("https://github.com/kwheelans/pass-it-on/releases/download/v$pkgver/pass-it-on-v$pkgver.tar.gz")
b2sums=('6be7ca435fe8b624c6b275820aa7374898d2300bfb9ef53493ba6a2551f13ffa0c20ff7b3c4bc093450f98b1c8926fd097098cf92618679f4397b1dfbfa8108c')

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --manifest-path pass-it-on-$pkgver/Cargo.toml
}


build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --bin $pkgname --release --manifest-path pass-it-on-$pkgver/Cargo.toml --no-default-features --features server-bin-full
}

#check() {
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen -features server-bin-full
#}

package() {
	install -Dm0755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 "$srcdir/pass-it-on-$pkgver/resources/systemd/pass-it-on-server.service" "$pkgdir/usr/lib/systemd/system/pass-it-on-server.service"
	install -Dm0644 "$srcdir/pass-it-on-$pkgver/resources/configuration/server_example.toml" "$pkgdir/etc/pass-it-on/server_example.toml"
	
	# Install system user
	#install -Dm0644 "$srcdir/pass-it-on-$pkgver/resources/systemd/pass-it-on-server-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/pass-it-on-server.conf"

	# Package licenses
	install -Dm0644 "$srcdir/pass-it-on-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

