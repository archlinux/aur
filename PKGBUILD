# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: SteamedFish <steamedfish@hotmail.com>
pkgname=zeroclaw
pkgver=0.3.1
pkgrel=1
pkgdesc="Zero overhead, fully autonomous AI assistant runtime (100% Rust)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/zeroclaw-labs/zeroclaw"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc')
optdepends=('bubblewrap: sandbox-bubblewrap isolation support'
            'chromium: browser-native feature'
            'postgresql: memory-postgres backend')
makedepends=('rust' 'clang' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zeroclaw-labs/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "zeroclaw.service"
        "zeroclaw.sysusers"
        "zeroclaw.tmpfiles")
sha256sums=('83cefb6ca0280e240c5009bf430029de0845ec26a11b6ce6265308dee98f6ec7'
            'de97ac176531d176ac627bd031e8a79f7adb5a440f321c9b9b0a492fda1154ee'
            '5e22a9f53bab669beab7058c8b7d1c2b090eb7900fb8c9bd94fd3ad609e7afbf'
            '07911d8ca762bc87daf58e7d72ad9067517baedaeccd65f2ae7609962af8216f')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    # Workaround for rustc 1.94.0 regression (matrix-rust-sdk#6254, zeroclaw#2905):
    # matrix-sdk v0.16.0 is missing #![recursion_limit="256"] which overflows the
    # default query depth limit introduced in rustc 1.94.0.
    local msdk_lib
    msdk_lib=$(find "$srcdir/.cargo-home/registry/src" -path '*/matrix-sdk-0.16.*/src/lib.rs' 2>/dev/null | head -1)
    if [[ -n "$msdk_lib" ]] && ! grep -q 'recursion_limit' "$msdk_lib"; then
        sed -i '1s/^/#![recursion_limit = "256"]\n/' "$msdk_lib"
    fi
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # zeroclaw requires clang; gcc will not compile successfully
    export CC=clang
    export CXX=clang++
    export CARGO_HOME="$srcdir/.cargo-home"
    # aws-lc-sys/jitterentropy requires -O0 but Arch injects -O2 via CFLAGS;
    # unsetting prevents the C build from failing with 'timing not safe'
    unset CFLAGS CXXFLAGS
    cargo build \
        --release \
        --frozen \
        --features channel-lark,channel-matrix,channel-nostr,memory-postgres,observability-otel,observability-prometheus,browser-native,sandbox-landlock,sandbox-bubblewrap,rag-pdf,whatsapp-web
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    # system service (systemctl enable --now zeroclaw)
    install -Dm644 "$srcdir/zeroclaw.service" "$pkgdir/usr/lib/systemd/system/zeroclaw.service"
    # system user and state directory
    install -Dm644 "$srcdir/zeroclaw.sysusers" "$pkgdir/usr/lib/sysusers.d/zeroclaw.conf"
    install -Dm644 "$srcdir/zeroclaw.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/zeroclaw.conf"
}
