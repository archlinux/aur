# Maintainer: alienzj <alienchuj@gmail.com>

pkgname=geph4-git
pkgver=r243.023650b
pkgrel=1
pkgdesc='A command-line Geph4 tools'
arch=('x86_64')
url="https://github.com/geph-official/geph4"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
provides=("geph4-git")
conflicts=("geph4")
source=("git+$url.git"
        "geph4-client.service"
        "geph4-client@.service"
        "geph4-client-user.service"
        "geph4-exit.service"
        "geph4-exit-user.service"
        "geph4-client.sysusers"
        "geph4-exit.sysusers")
sha512sums=('SKIP'
            'e1d8b5bcd6c7dc631947ec7d2734de2cc018cb9c0e47623ddf072c17adc1c8c4e4b25e6f5cab9d3e5fb3cdfe58d9d4e677c1481de7ce8ffdc9a204084c3325d7'
            'e1d8b5bcd6c7dc631947ec7d2734de2cc018cb9c0e47623ddf072c17adc1c8c4e4b25e6f5cab9d3e5fb3cdfe58d9d4e677c1481de7ce8ffdc9a204084c3325d7'
            'a7f67c905d808bfea4be035572d4748ec087f82cab7e649e687ec92492c19d447a8ed671e93bf1fac9524e3d223ff6a8bae84c2ff4485dc921e95b1a976832a0'
            'fb52090d9d7ca92512728966e64fe668c1b468cb0d09a1b2331702d6cbdb6e008560af8981acf4dec0892952d40d4aeb58b18907bbd8e5936d11609962a47a0f'
            'fb52090d9d7ca92512728966e64fe668c1b468cb0d09a1b2331702d6cbdb6e008560af8981acf4dec0892952d40d4aeb58b18907bbd8e5936d11609962a47a0f'
            'dc7bc790d4c33a7a5d7c603f0dd339d28a31e5082b936ed8e31b5b2ffb26e63343be633cc432bf69e7444158bcd5af2620ac95bc458e37b442d6f89b6050d9ca'
            '60531d24beaa8b4934191d05f5d70b4f4a154824e3b23ec3f545be5dffec237ed2efb0a85b7dca33f302cf834e822fd47c9733ef95098356167e6c9d01a2c2c7')

pkgver() {
    cd geph4
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd geph4
    cargo build --release --manifest-path=geph4-client/Cargo.toml
    cargo build --release --manifest-path=geph4-vpn-helper/Cargo.toml
    cargo build --release --manifest-path=geph4-binder/Cargo.toml
    cargo build --release --manifest-path=geph4-bridge/Cargo.toml
    cargo build --release --manifest-path=geph4-exit/Cargo.toml
}

package() {
    cd geph4

    install -Dm755 target/release/geph4-client "$pkgdir/usr/bin/geph4-client"
    install -Dm755 target/release/geph4-vpn-helper   "$pkgdir/usr/bin/geph4-vpn-helper"
    install -Dm755 target/release/geph4-binder "$pkgdir/usr/bin/geph4-binder"
    install -Dm755 target/release/geph4-bridge "$pkgdir/usr/bin/geph4-bridge"
    install -Dm755 target/release/geph4-exit   "$pkgdir/usr/bin/geph4-exit"

    install -Dm 644 "$srcdir/geph4-client.service"  -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm 644 "$srcdir/geph4-client@.service" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm 644 "$srcdir/geph4-exit.service"    -t "$pkgdir/usr/lib/systemd/system/"

    install -Dm 644 "$srcdir/geph4-client-user.service" "$pkgdir/usr/lib/systemd/user/geph4-client.service"
    install -Dm 644 "$srcdir/geph4-exit-user.service"   "$pkgdir/usr/lib/systemd/user/geph4-exit.service"

    install -Dm 644 "$srcdir/geph4-client.sysusers" "$pkgdir/usr/lib/sysusers.d/geph4-client.conf"
    install -Dm 644 "$srcdir/geph4-exit.sysusers"   "$pkgdir/usr/lib/sysusers.d/geph4-exit.conf"
}
