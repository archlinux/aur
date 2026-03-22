# Maintainer: Andrii Tantsiura <antostcr@gmail.com>
pkgname=vigil-anticheat
pkgver=0.3.0
pkgrel=1
pkgdesc="Linux-native anti-cheat for competitive gaming"
arch=('x86_64')
url="https://github.com/TOSTcRa/vigil"
license=('AGPL-3.0-or-later')
depends=('sqlite')
makedepends=('rust' 'cargo' 'openssl' 'clang')
backup=('etc/vigil/config.toml')
source=("vigil-$pkgver.tar.gz::https://github.com/TOSTcRa/vigil/archive/v$pkgver.tar.gz")
sha256sums=('d250457391eeeb8c7e69a382e69b7cb4d5c59dcd713243309e94d3c0043ffafd')

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

    # ebpf bytecode
    make -C kernel/ebpf || true
    if [[ -f kernel/ebpf/vigil.bpf.o ]]; then
        install -Dm644 kernel/ebpf/vigil.bpf.o "$pkgdir/usr/lib/vigil/vigil.ebpf"
    fi

    # systemd services
    install -Dm644 dist/init/systemd/vigil.service "$pkgdir/usr/lib/systemd/system/vigil.service"
    install -Dm644 dist/init/systemd/vigil-server.service "$pkgdir/usr/lib/systemd/system/vigil-server.service"

    # directories
    install -dm755 "$pkgdir/etc/vigil"
    install -dm755 "$pkgdir/var/lib/vigil"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
