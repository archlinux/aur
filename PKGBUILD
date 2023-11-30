# Maintainer: éclairevoyant
# Co-Maintainer: strawberry <strawberry@puppygock.gay>

pkgname=conduit
pkgver=0.6.0
pkgrel=2
pkgdesc='Simple, fast and reliable chat server powered by Matrix'
arch=(x86_64 aarch64 armv7h armv6h)
url='https://conduit.rs/'
license=(Apache)
depends=(gcc-libs)
makedepends=(cargo clang git rust)
backup=("etc/conduit-matrix/$pkgname.toml")
source=("git+https://gitlab.com/famedly/$pkgname.git#commit=0c2cfda3ae923d9e922d5edf379e4d8976a52d4e"
        $pkgname.{service,sysusers,tmpfiles,toml})
b2sums=('SKIP'
        '8c9370cf89a78edde10a8413a01ed26cedb7eac0cc4daba0373733db9391a60d080f0a85ca885c69a8c29091cb6deab687b8b3c964269a49e40ee786f5292268'
        '4d6acac3e3d43b63fb62c5c6cfc0c83609ee8787c0777b62355815d0c125c67b0063a3d3deff2eba92b502c3b2cf330a76671a45bcc6206faeffb87c38ce5e85'
        'd23699d33e02103f3854ef0dc02a64cc8bc4b6921bd443e4155574ca029e10b8a3f64e82904422a2df3b16ba84edfe15b5380c99b1e4c473189bb69bf63cecef'
        '46b530541d0614c7855d4148882826d3ab8755c6a3fa71fd50c1516f09999a1f46adbeaf59f04f81bcb1e9640f946835c7226cabe8997b6821e9468c3fce3c43')

prepare() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export RUST_BACKTRACE=1
	cargo build --frozen --release
}

check() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	install -vDm755 $pkgname/target/release/$pkgname "$pkgdir/usr/bin/conduit-matrix"
	install -vDm0644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname-matrix.service"
	install -vDm0644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -vDm0644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -vDm0644 $pkgname.toml "$pkgdir/etc/conduit-matrix/$pkgname.toml"
	install -vDm0644 $pkgname.toml "$pkgdir/usr/share/doc/conduit-matrix/$pkgname-example.toml"
}
