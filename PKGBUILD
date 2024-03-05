# Maintainer: Kevin Wheelans <kevin dot wheelans at proton dot me>

pkgname="pass-it-on-server"
pkgver=0.14.2
pkgrel=1
pkgdesc="Pass-it-on server component"
arch=("any")
license=("MIT")
url="https://github.com/kwheelans/pass-it-on"
conflicts=("pass-it-on-server-bin")
depends=("openssl" "sqlite")
makedepends=("cargo")
source=("https://github.com/kwheelans/pass-it-on/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('786a02f742015903c6c6fd852552d272912f4740e15847618a86e217f71f5419d25e1031afee585313896444934eb04b903a685b1448b755d56f701afe9be2ce')

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

