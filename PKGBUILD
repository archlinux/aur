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
        '3530a017149ce79371ec1b269c2a484f4782eea622f7a3d495bfb4577502e38f3ddf32cdd4e2a9b0d85efc62be28873203c2b0baaead405ae8eda4c686df9c0d'
        '4d6acac3e3d43b63fb62c5c6cfc0c83609ee8787c0777b62355815d0c125c67b0063a3d3deff2eba92b502c3b2cf330a76671a45bcc6206faeffb87c38ce5e85'
        'd23699d33e02103f3854ef0dc02a64cc8bc4b6921bd443e4155574ca029e10b8a3f64e82904422a2df3b16ba84edfe15b5380c99b1e4c473189bb69bf63cecef'
        '7949dfa901d6e08d1c954695425a2c7239eb2271c896329a60bc9f7ec8a842cb1e9826efc3c4bf49434eb5c9ff3fd35c1c5cbad21a1b9d13745f078baebfcb96')

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
