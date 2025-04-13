# Maintainer: metamuffin <metamuffin@disroot.org>

pkgname=gnix
pkgver=2.4.1
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
sha256sums=('28afe0ec345b418de6686af30e4700dc26d47c54bd648a7cb8e9772f2504129b'
            'a80df54a4e44960decf43ad618dc1afef9cc498370460362e91646ac3f95358e'
            '6f39c6a2e82f9e09eb7ffe5082bfdd795936c3665863f118fcfd4135bc8e70f1'
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
    install -Dm755 gnix/target/$(rust_chost)/release/gnix "$pkgdir/usr/bin/gnix"
    install -Dm644 gnix/src/modules/auth/login.html "$pkgdir/usr/share/gnix/login.html"
    install -Dm644 config.yaml "$pkgdir/etc/gnix.yaml"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/gnix.conf"
    install -Dm644 gnix.service "$pkgdir/usr/lib/systemd/system/gnix.service"
    install -Dm644 gnix/COPYING "$pkgdir/usr/share/licenses/gnix/COPYING"
}
