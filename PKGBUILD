# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
_pkgname=mail-server
pkgname="stalwart-$_pkgname"
pkgver=0.11.7
pkgrel=1
pkgdesc="Secure & Modern All-in-One Mail Server"
url="https://github.com/stalwartlabs/mail-server"
arch=('x86_64' 'aarch64')
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'cargo-auditable' 'protobuf' 'clang')
options=('!buildflags') # https://github.com/briansmith/ring/issues/1444
source=(
	"https://github.com/stalwartlabs/mail-server/archive/v$pkgver/mail-server-$pkgver.tar.gz"
	"config.toml"
	"stalwart-mail.service"
	"stalwart-mail.sysusers"
	"stalwart-mail.tmpfiles"
)
sha512sums=('ba586e589d58c8231c53a240a012fa613dbfdc7b4ad341d1bdb1eac28851775e5df5be492a48f392d125814c48de1a33d45b1a87702dafe4e24d26935cae0138'
            '6c5eb49d1b9707e35e811f959b702af2988667287bdbf484a305b2bc8ef1bd96d49054698bb5bb177cd3ca798e42a6a41efd46ee3be2d6a4765edda38d7a3995'
            'c3b66be0f6cf6a31b646bfb8ae20e847932bc9ca1de5b572716340e45532d8f24faa5b71531c835fc9319c4950412194f8b5deafee73e8650559ddd8d64903eb'
            'ab307a09fcb802fdec29811b51288ed1e80f3f00550e60d2f82310892aa900f15a68942e531f78269b5527f4f6c69b1c255cf108d8d19dbf10f535f0ffa9f66a'
            'c811d14233606bd3fdb698e781c11acc4626c14546d6a678aa12a482a40e22384b3fd2879f845cfce0ccb14d23eaaeff68625c9a9f922da6956eba7e4d88aa00')

prepare() {
	cd "$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgname-$pkgver"
	case "$CARCH" in
		arm*) export JEMALLOC_SYS_WITH_LG_PAGE=16;;
	esac
	cargo auditable build --frozen --release -p mail-server -p stalwart-cli
}

check() {
	cd "$_pkgname-$pkgver"
	# https://github.com/RustCrypto/elliptic-curves/issues/1097
	export RUST_MIN_STACK="4194304"
	cargo test --frozen -p mail-server -p stalwart-cli
}

package() {
	install -Dm 644 "$srcdir"/stalwart-mail.service \
		"$pkgdir"/usr/lib/systemd/system/stalwart-mail.service
	install -Dm 644 "$srcdir"/stalwart-mail.sysusers \
		"$pkgdir"/usr/lib/sysusers.d/${pkgname}.conf
	install -Dm 644 "$srcdir"/stalwart-mail.tmpfiles \
		"$pkgdir"/usr/lib/tmpfiles.d/${pkgname}.conf
	install -Dm 644 "$srcdir"/config.toml \
		"$pkgdir"/etc/stalwart-mail/config.toml
	install -Dm 755 "$srcdir"/"$_pkgname-$pkgver"/target/release/stalwart-mail \
		"$pkgdir"/usr/bin/stalwart-mail
	install -Dm 755 "$srcdir"/"$_pkgname-$pkgver"/target/release/stalwart-cli \
		"$pkgdir"/usr/bin/stalwart-cli
}
