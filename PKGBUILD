# Maintainer: Andrii Tantsiura <antostcr@gmail.com>
pkgname=vigil-anticheat
pkgver=0.2.0
pkgrel=1
pkgdesc="Linux-native anti-cheat for competitive gaming"
arch=('x86_64')
url="https://github.com/TOSTcRa/vigil"
license=('AGPL-3.0-or-later')
depends=()
makedepends=('rust' 'cargo')
backup=('etc/vigil/config.toml')
source=("vigil-$pkgver.tar.gz::https://github.com/TOSTcRa/vigil/archive/v$pkgver.tar.gz")
sha256sums=('d3127cdf97ee7dc9847f41d329062ef070dc3123f48a8723cae92397485e6988')

build() {
    cd "vigil-$pkgver"
    cargo build -p vigil -p vigil-server --release
}

check() {
    cd "vigil-$pkgver"
    cargo test -p vigil -p vigil-server -p vigil-common
}

package() {
    cd "vigil-$pkgver"

    # binaries
    install -Dm755 target/release/vigil "$pkgdir/usr/bin/vigil"
    install -Dm755 target/release/vigil-server "$pkgdir/usr/bin/vigil-server"

    # ebpf bytecode if built
    if [[ -f target/bpfel-unknown-none/release/vigil ]]; then
        install -Dm644 target/bpfel-unknown-none/release/vigil \
            "$pkgdir/usr/lib/vigil/vigil.ebpf"
    fi

    # systemd services
    install -Dm644 init/systemd/vigil.service "$pkgdir/usr/lib/systemd/system/vigil.service"
    install -Dm644 init/systemd/vigil-server.service "$pkgdir/usr/lib/systemd/system/vigil-server.service"

    # directories
    install -dm755 "$pkgdir/etc/vigil"
    install -dm755 "$pkgdir/var/lib/vigil"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
