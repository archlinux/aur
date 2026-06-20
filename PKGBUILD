# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgbase=aivpn
pkgname=('aivpn-client' 'aivpn-server' 'aivpn-kernel-dkms')
pkgver=0.9.2
pkgrel=1
arch=('x86_64')
url="https://github.com/infosave2007/aivpn"
license=('MIT')
makedepends=('rust' 'cargo')
source=(
    "$pkgbase-$pkgver.tar.gz::https://github.com/infosave2007/aivpn/archive/refs/tags/v${pkgver}.tar.gz"
    'aivpn-server.service'
    'aivpn-server.sysusers'
    'aivpn-server.tmpfiles'
    'aivpn-server.install'
    'aivpn-client@.service'
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin aivpn-server
    cargo build --frozen --release --bin aivpn-client
}

package_aivpn-client() {
    pkgdesc='AIVPN client — connects to an aivpn-server endpoint'
    depends=()
    optdepends=('aivpn-kernel-dkms: optional kernel-accelerated data path')

    install -Dm755 "$pkgbase-$pkgver/target/release/aivpn-client" \
        "$pkgdir/usr/bin/aivpn-client"
    install -Dm644 'aivpn-client@.service' \
        "$pkgdir/usr/lib/systemd/system/aivpn-client@.service"
    install -dm750 "$pkgdir/etc/aivpn/keys"
}

package_aivpn-server() {
    pkgdesc='AIVPN server — gateway with traffic mimicry and DPI evasion'
    depends=()
    optdepends=('aivpn-kernel-dkms: optional kernel-accelerated data path')
    backup=(
        'etc/aivpn/server.json'
        'etc/aivpn/clients.json'
    )
    install='aivpn-server.install'

    install -Dm755 "$pkgbase-$pkgver/target/release/aivpn-server" \
        "$pkgdir/usr/bin/aivpn-server"
    install -Dm644 'aivpn-server.service' \
        "$pkgdir/usr/lib/systemd/system/aivpn-server.service"
    install -Dm644 'aivpn-server.sysusers' \
        "$pkgdir/usr/lib/sysusers.d/aivpn-server.conf"
    install -Dm644 'aivpn-server.tmpfiles' \
        "$pkgdir/usr/lib/tmpfiles.d/aivpn-server.conf"
    install -Dm640 "$pkgbase-$pkgver/deploy/config/server.json.example" \
        "$pkgdir/etc/aivpn/server.json"
    # Empty client DB placeholder — preserved across upgrades via backup=
    echo '{}' | install -Dm640 /dev/stdin \
        "$pkgdir/etc/aivpn/clients.json"

    local mask
    for mask in "$pkgbase-$pkgver/assets/masks/"*.json; do
        install -Dm644 "$mask" \
            "$pkgdir/var/lib/aivpn/masks/$(basename "$mask")"
    done
}

package_aivpn-kernel-dkms() {
    pkgdesc='AIVPN kernel module (DKMS) — in-kernel fast path (Linux 6.1+, CONFIG_RUST=y required)'
    arch=('any')
    depends=('dkms')
    optdepends=(
        'linux-headers: build against the default kernel'
        'linux-lts-headers: build against linux-lts'
        'rust-bindgen: required for Rust-for-Linux module compilation'
        'clang: optional — enables XDP fast-path filter'
    )

    local ksrc="$pkgbase-$pkgver/platforms/linux-kernel"
    local dst="$pkgdir/usr/src/aivpn-$pkgver"

    install -dm755 "$dst"
    cp -r "$ksrc/src"     "$dst/"
    cp -r "$ksrc/include" "$dst/" 2>/dev/null || true
    cp -r "$ksrc/scripts" "$dst/" 2>/dev/null || true
    install -Dm644 "$ksrc/Makefile" "$dst/Makefile"
    install -Dm644 "$ksrc/Kbuild"   "$dst/Kbuild"

    sed "s/@VERSION@/$pkgver/g" "$ksrc/dkms.conf" > "$dst/dkms.conf"
    chmod 644 "$dst/dkms.conf"
}
