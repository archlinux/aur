# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=shadow-tls
pkgver=0.2.25
pkgrel=4
_commit=02dd0bc7bae8a2011729f95021690e694fd8e43e
pkgdesc='A proxy to expose real tls handshake to the firewall.'
arch=('x86_64')
url='https://github.com/ihciah/shadow-tls'
license=('MIT' 'Apache')
makedepends=('cargo-nightly' 'git')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
source=("git+https://github.com/ihciah/shadow-tls.git#commit=${_commit}"
	"shadow-tls@.service")
sha256sums=('d0d807583f66b8332f2732464471b3ec74924ad3474fc80b71a6262630ab077a'
            '670a28a4eafc0617052bac6dfbf8160ddb31787cc59f6541ff399cabecbef627')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
    export RUSTFLAGS=""
    unset CFLAGS
    unset LDFLAGS
    rustup target add $CARCH-unknown-linux-gnu
    cargo build --target $CARCH-unknown-linux-gnu --release --all-features --bin "$pkgname"
}

package() {
    cd "$pkgname"
    install -Dm0755 "target/$CARCH-unknown-linux-gnu/release/$pkgname" -t "$pkgdir/usr/bin"
    install -dm0755 "$pkgdir/etc/shadow-tls"
    cp examples/* "$pkgdir/etc/shadow-tls"
    install -Dm0644 "$srcdir/shadow-tls@.service" "$pkgdir/usr/lib/systemd/system/shadow-tls@.service"
}
