# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=gnix
pkgver=2.6.0
pkgrel=1
pkgdesc="a simple stupid http reverse proxy"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/metamuffin/gnix"
license=('AGPL3')
makedepends=('rustup')
backup=('etc/gnix.yaml')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/metamuffin/gnix/archive/v$pkgver.tar.gz"
        "gnix.service"
        "config.yaml"
        "sysusers.conf")
sha256sums=('ffd2f306e5cc2a1ff32d274702e919e90385a2e78f57172161120bf9e4d28381'
            '658a194c65afee7b20f91a55673af0654aec7db5d108291fd299355ac0398642'
            'f747b1549c1c18996b1b0fac7768b248179b479027768d742e4389e9504be1de'
            '9e03be16b1b3dd4c0d0e5feb5c31221758b68a54bad5ba7232e8565d766ea620')

rust_chost() {
	sed -e "s/-pc-linux/-unknown-linux/" -e "s/armv7l-/armv7-/" <<< "$CHOST"
}

prepare() {
    cd "gnix"
    cargo +nightly fetch --locked --target "$(rust_chost)"
}
build() {
    cd "gnix"
    cargo +nightly build --frozen --release --target "$(rust_chost)"
}
package() {
    install -Dm755 gnix/target/"$(rust_chost)"/release/gnix "$pkgdir/usr/bin/gnix"
    install -Dm644 gnix/src/modules/auth/login.html "$pkgdir/usr/share/gnix/login.html"
    install -Dm644 config.yaml "$pkgdir/etc/gnix.yaml"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/gnix.conf"
    install -Dm644 gnix.service "$pkgdir/usr/lib/systemd/system/gnix.service"
    install -Dm644 gnix/COPYING "$pkgdir/usr/share/licenses/gnix/COPYING"
}
