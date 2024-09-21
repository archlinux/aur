# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=shadow-tls
pkgver=0.2.25
pkgrel=3

pkgdesc='A proxy to expose real tls handshake to the firewall.'
arch=('x86_64')
url='https://github.com/ihciah/shadow-tls'
license=('MIT' 'Apache')

makedepends=('cargo-nightly')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"shadow-tls@.service")
sha256sums=('1d1d436734823ba0302de6e91883ed892ea710769c722a139990194ff5837224'
            '670a28a4eafc0617052bac6dfbf8160ddb31787cc59f6541ff399cabecbef627')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
    export RUSTFLAGS=""
    unset CFLAGS
    unset LDFLAGS
    cargo build --frozen --release --all-features --bin "$pkgname"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -dm0755 "$pkgdir/etc/shadow-tls"
    cp examples/* "$pkgdir/etc/shadow-tls"
    install -Dm0644 "$srcdir/shadow-tls@.service" "$pkgdir/usr/lib/systemd/system/shadow-tls@.service"
}
