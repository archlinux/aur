# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-server"
pkgver=0.14.2
pkgrel=2
pkgdesc="Pass-it-on server component"
arch=("any")
license=("MIT")
url="https://github.com/kwheelans/pass-it-on"
conflicts=("pass-it-on-server-bin")
depends=("openssl" "sqlite")
makedepends=("cargo")
source=("https://github.com/kwheelans/pass-it-on/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('812c0247dc8743c91ac466920ac808f77e4856ec6262c1adf540aae87a5d285eb789442be28e1ae14d63ecebda9a3986fe8b7c04b1f3bc78f010e1ccbdf54ed8')

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --manifest-path pass-it-on-$pkgver/Cargo.toml
}


build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --bins --release --manifest-path pass-it-on-$pkgver/Cargo.toml --no-default-features --features server-bin-full
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

