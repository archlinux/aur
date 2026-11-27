# Maintainer: Bagas Sanjaya <bagasdotme@gmail.com>
pkgname=kryoptic
pkgver=1.5.5
pkgrel=1
pkgdesc="A PKCS #11 software token written in Rust"
arch=('x86_64')
url="https://github.com/latchset/kryoptic"
license=('Apache-2.0')
depends=('brotli' 'glibc' 'zlib' 'zstd' 'sqlite' 'openssl')
makedepends=('rust' 'cargo' 'go-md2man' 'clang-libs' 'clang')
backup=('etc/kryoptic/token.conf')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
	"pin-cargo-lock.patch"
	"token.conf")
sha256sums=('8ccc273c58d8ec901f86a6eb4cd1cf258b4c7e83826d92f2c10190893b5d98c5'
            '39e74f68d08a2761d7a5179d093799c831671bfa533f1200a913ea85b18537fc'
            '84ab4485a53f12cfa385109756f44d0269f27ec056f82e2f8cba91301abe15a1')

_features="standard,pqc"

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i $srcdir/pin-cargo-lock.patch
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$pkgname-$pkgver"
	CONFDIR=/etc/kryoptic cargo build --release --frozen --features $_features

	cd tools
	cargo build --release --frozen

	# manpages
	cd ../
	go-md2man -in doc/kryoptic.conf.man.md | gzip - > kryoptic.conf.5.gz
	go-md2man -in doc/kryoptic.man.md | gzip - > kryoptic.7.gz
	go-md2man -in tools/softhsm/softhsm_migrate.man.md | gzip - > softhsm_migrate.1.gz
	go-md2man -in tools/otp/kryoptic_otp.man.md | gzip - > kryoptic_otp.1.gz
}

check() {
	cd "$pkgname-$pkgver"
	CONFDIR=/etc/kryoptic cargo test --frozen --features $_features
}

package() {
	cd "$pkgname-$pkgver"
	install -v -D -m 0755 -t "$pkgdir/usr/bin" target/release/kryoptic_init
	install -v -D -m 0755 -t "$pkgdir/usr/bin" target/release/kryoptic_otp
	install -v -D -m 0755 -t "$pkgdir/usr/bin" target/release/softhsm_migrate

	install -v -D -m 0755 -t "$pkgdir/usr/lib/pkcs11" target/release/libkryoptic_pkcs11.so
	install -v -D -m 0644 -t "$pkgdir/etc/kryoptic" "$srcdir/token.conf"

	install -v -D -m 0644 -t "$pkgdir/usr/share/man/man5" kryoptic.conf.5.gz
	install -v -D -m 0644 -t "$pkgdir/usr/share/man/man7" kryoptic.7.gz
	install -v -D -m 0644 -t "$pkgdir/usr/share/man/man1" softhsm_migrate.1.gz
	install -v -D -m 0644 -t "$pkgdir/usr/share/man/man1" kryoptic_otp.1.gz
	install -v -D -m 0644 -t "$pkgdir/usr/share/doc/kryoptic" doc/User_Guide.md
}
