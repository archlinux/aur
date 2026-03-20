# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: SteamedFish <steamedfish@hotmail.com>
pkgname=zeroclaw
pkgver=0.5.4
pkgrel=1
pkgdesc="Fast, small, and fully autonomous AI assistant infrastructure — deploy anywhere, swap anything (Rust)"
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
b2sums=('d48fd1b0cf886601c1f0afd29317ac3160682539948f8eefc04cf427cc025aa0611c2ba16b4c1cdf9536540c0906be3c028ff93b19a643593f1660b588c115a5'
        'fe6c6be25e8917f359e169a1fb52efb69f745f8a336200a138d3dff47e28fd4ad2d87a36da7f2799c14ce43f8cef3091b85d2827bdd86e6ce988b71fa4bda20d'
        '5a8b22eefdec54b475dec402b58a432894fa5696b50493a90569e1179d0a4242bc3efd2a514ee71cb6beb60b70789ebce65fc2c1815ae4144ae51814654015bf'
        '9e6ccb731e2d61cc8d4bea3e3a287762090e46a5e3a05cab6fb80b89ee0ab04264173be95b19ad299148b3e894d1cf1070b6ba926eea1927ed60d6378d14d729')

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
        --features channel-lark,channel-matrix,channel-nostr,memory-postgres,observability-otel,observability-prometheus,browser-native,sandbox-landlock,sandbox-bubblewrap,rag-pdf,whatsapp-web,plugins-wasm,skill-creation
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
