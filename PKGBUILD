# Maintainer: éclairevoyant

pkgname=conduit
pkgver=0.6.0
epoch=1
pkgrel=1
pkgdesc='Simple, fast and reliable chat server powered by matrix'
arch=(x86_64)
url='https://conduit.rs/'
license=(Apache)
depends=(gcc-libs)
makedepends=(cargo clang git rust)
backup=("etc/matrix-conduit/$pkgname.toml")
source=("git+https://gitlab.com/famedly/$pkgname.git#commit=0c2cfda3ae923d9e922d5edf379e4d8976a52d4e"
        $pkgname.{service,sysusers,tmpfiles,toml})
b2sums=('SKIP'
        '2164d78b7112e35b3410b1831a14ce32b44c170ef1596e75fcfbe4dad16c13cd5d427d242ae6ab7d1c44f540864064e88094df1c48d8f3c70547eba4fd1b230f'
        'c03409ad8020072f60e12676091462f1987d504c6b30e63576fde49d99f9bd941354f288bf6cda743a8af634aa1323dd4681b55fd7928bc41bbee384cec574b9'
        '907e983de7833f9f11693a063c0754cf8731ad6501f9088ae50c42cd88370213757506c4b5d10808f7abbfcec99056b6b9824189714da3338352cd67311949fe'
        '8f0151083329a001264a3ceb01aea750e8d620a8993d4633c7aecdc8459e87f0c7ca06e53e2653beda267dcf387945fcb913a64ecc83464d9c9b577eabd1f67e')

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
	export CARGO_PROFILE_RELEASE_BUILD_OVERRIDE_DEBUG=true
	cargo build --frozen --release --all-features
}

check() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	install -vDm755 $pkgname/target/release/$pkgname "$pkgdir/usr/bin/conduit-matrix"
	install -vDm644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
	install -vDm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -vDm644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -vDm644 $pkgname.toml -t "$pkgdir/etc/matrix-conduit/"
}
