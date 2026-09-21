# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgbase=aivpn
pkgname=('aivpn-client' 'aivpn-server' 'aivpn-kernel-dkms')
pkgver=1.1.0
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
sha512sums=('7813db0821439e3e9c6f41407ac59658f7c6897e993190cfae1bea8186e734751e0ca84ed3895df7220d4b674a9986e0928c9e9d8c094ecc15b80d85ee7bf5af'
            'd9b68153914a3ce30c4cc23fc6e1a13b4460e0d6ccaf5e9945bd1a46bd780239ee8bd62e3627e13b082d47dded074eacd5d9109cd04afa6fcfa1a0561cc94197'
            '7862443dbfd9aedc8c1c279f6c4532c9ac8359329ea076f967c6cbad77f83b6506cd124d815bbaf48356dbdb8c27c537fdfb187c7c48755728603bf4beed6409'
            '649912ba3d34ec82c9d1360d1e0d572c727834ee2ce321da84211fd89159884ead1417ac1d9320b13694247cc08896105116c104733f38271c43740485e03942'
            'f11cf113932772e5cb90ea6c1e19a14db83aa420f931fc4f09da46d9da90a5e7772a03b9528316093dc1ce044c855dbd84030b2bd6307274dae3611e74fa4608'
            '5bb056f29c71db4545f6327272d8d9db8c80accdc88f2d2b131ceadc9be5b25191e521ae3e6aafa3d913a677a155cbdf464fa2dc35d166096c4324610a524443')

prepare() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Full server build: management-api is required by the aivpn-web panel
    cargo build --frozen --release --bin aivpn-server \
        --features 'management-api,metrics,neural'
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
    # Client DB lives in /var/lib/aivpn/clients.json, created by post_install()

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
