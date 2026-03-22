# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: SteamedFish <steamedfish@hotmail.com>
pkgname=zeroclaw
pkgver=0.5.6
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
        "zeroclaw-gateway.service"
        "zeroclaw-user.service"
        "zeroclaw.sysusers"
        "zeroclaw.tmpfiles")
b2sums=('7bc601e3f9aa313303b4d955d44b5be616705ac8c923e7ecdba8e2e35bd55b8dfdf1473efc6c9fb73fafda942f1e533bfdbbd0168c78b208b9b311d36416c2c3'
        'e5673f822e1b470538013147d88009e7b90bf9ec0a02a86d8c6fa5f72d0c73f78b403c583ba0a196099cebfacf78f865ade532c9c901dc5f1fd78362ed9c3dee'
        '461f5245dbb1abac54d4db8f8c1e31d8e8c98c61bf224b0c8d677f616ce83b1694a86db09ecf6ad9dd847d4000182f0afebcd41f6ac7baccc6ca58388cfb5498'
        'b673a54133c1c2feaf63a2e74c7f49d9190335afbae19d83c56395224dd201336d6c9895648f947fc4b449336b6c370811a1cca6d21526374b90fbeaff530d2e'
        '5a8b22eefdec54b475dec402b58a432894fa5696b50493a90569e1179d0a4242bc3efd2a514ee71cb6beb60b70789ebce65fc2c1815ae4144ae51814654015bf'
        '6e0d8f0742e36310fbdbc551426df1e88bb3eca9bed34a8ab12a8dceb74c61efc957e3e52b22a51706353a82188bba841cbbc9369bb793632c97f816e8965b65')

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
    install -Dm644 "$srcdir/zeroclaw-gateway.service" "$pkgdir/usr/lib/systemd/system/zeroclaw-gateway.service"
    # user service (systemctl --user enable --now zeroclaw)
    # zeroclaw-user.service is copied verbatim from upstream's install_linux_systemd()
    # in src/service/mod.rs — verify it still matches on every version bump.
    install -Dm644 "$srcdir/zeroclaw-user.service" "$pkgdir/usr/lib/systemd/user/zeroclaw.service"
    # system user and state directory
    install -Dm644 "$srcdir/zeroclaw.sysusers" "$pkgdir/usr/lib/sysusers.d/zeroclaw.conf"
    install -Dm644 "$srcdir/zeroclaw.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/zeroclaw.conf"
}
