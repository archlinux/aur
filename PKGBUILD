# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=gnix
pkgver=2.2.0
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
sha256sums=('9ff1ebbf496c7c1df613fc46820091b92775816785d0026ddced6012204e8b1c'
            'a80df54a4e44960decf43ad618dc1afef9cc498370460362e91646ac3f95358e'
            'dae3df7d0d521b075d16ab518bc321a63bc0ca7822b814aed6e00402577d380b'
            '9e03be16b1b3dd4c0d0e5feb5c31221758b68a54bad5ba7232e8565d766ea620')

prepare() {
    cd "gnix"
    cargo +nightly fetch --locked --target "$CHOST"
}
build() {
    cd "gnix"
    cargo +nightly build --frozen --release --target "$CHOST"
}
package() {
    install -Dm755 gnix/target/$CHOST/release/gnix "$pkgdir/usr/bin/gnix"
    install -Dm644 gnix/src/modules/auth/login.html "$pkgdir/usr/share/gnix/login.html"
    install -Dm644 config.yaml "$pkgdir/etc/gnix.yaml"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/gnix.conf"
    install -Dm644 gnix.service "$pkgdir/usr/lib/systemd/system/gnix.service"
    install -Dm644 gnix/COPYING "$pkgdir/usr/share/licenses/gnix/COPYING"
}
