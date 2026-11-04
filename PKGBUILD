# Maintainer: Bagas Sanjaya <bagasdotme@gmail.com>
pkgname=kryoptic
pkgver=1.5.4
pkgrel=1
pkgdesc="A PKCS #11 software token written in Rust"
arch=('x86_64')
url="https://github.com/latchset/kryoptic"
license=('Apache-2.0')
depends=('brotli' 'glibc' 'zlib' 'zstd' 'sqlite' 'openssl')
makedepends=('rust' 'cargo' 'pandoc' 'clang-libs' 'clang')
backup=('etc/kryoptic/token.conf')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
	"token.conf")
sha256sums=('bfa39be18e95f54009dfbd4e74a59a73c425b1cd1cc6236b3143f63141c41c03'
            '84ab4485a53f12cfa385109756f44d0269f27ec056f82e2f8cba91301abe15a1')

_features="standard,pqc"

prepare() {
	cd "$pkgname-$pkgver"
	cargo update
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "$pkgname-$pkgver"
	CONFDIR=/etc/kryoptic cargo build --release --frozen --features $_features

	cd tools
	cargo build --release --frozen

	# manpages
	cd ../
	pandoc -s -t man doc/kryoptic.conf.man.md -o kryoptic.conf.5
	gzip kryoptic.conf.5
	pandoc -s -t man doc/kryoptic.man.md -o kryoptic.7
	gzip kryoptic.7
	pandoc -s -t man tools/softhsm/softhsm_migrate.man.md -o softhsm_migrate.1
	gzip softhsm_migrate.1
	pandoc -s -t man tools/otp/kryoptic_otp.man.md -o kryoptic_otp.1
	gzip kryoptic_otp.1
}

check() {
	cd "$pkgname-$pkgver"
	CONFDIR=/etc/kryoptic cargo test --frozen --features $_features
}

package() {
	_tools=('kryoptic_init' 'kryoptic_otp' 'softhsm_migrate')
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
