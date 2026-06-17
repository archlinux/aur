# Maintainer: Wuxxin <wuxxin@gmail.com>
# Contributor: SteamedFish <steamedfish@hotmail.com>
pkgname=zeroclaw-git
pkgver=0.8.0.r187.g1a4ba770c2
pkgrel=1
pkgdesc="Fast, small, and fully autonomous AI assistant infrastructure — deploy anywhere, swap anything (Rust, Git VCS version)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/zeroclaw-labs/zeroclaw"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'glibc' 'alsa-lib')
optdepends=(
    'bubblewrap: sandbox-bubblewrap isolation support'
    'chromium: browser-native feature'
    'postgresql: memory-postgres backend'
)
makedepends=('rust' 'clang' 'cargo' 'nodejs' 'npm' 'git')
provides=("zeroclaw")
conflicts=("zeroclaw")
source=(
    "zeroclaw::git+https://github.com/zeroclaw-labs/zeroclaw.git"
    "fix-type-mismatch.patch"
    "zeroclaw.service"
    "zeroclaw-gateway.service"
    "zeroclaw-user.service"
    "zeroclaw.sysusers"
    "zeroclaw.tmpfiles"
)
b2sums=('SKIP'
        'ef9e9974d7b5a6137b3435d4ca559e9071bc903f7cea23ec262f89d2634b54cf1e44c466121179c3b6b6207e066d3ae198ca0163a09a5ce6483db59cc46cbf60'
        'e5673f822e1b470538013147d88009e7b90bf9ec0a02a86d8c6fa5f72d0c73f78b403c583ba0a196099cebfacf78f865ade532c9c901dc5f1fd78362ed9c3dee'
        '461f5245dbb1abac54d4db8f8c1e31d8e8c98c61bf224b0c8d677f616ce83b1694a86db09ecf6ad9dd847d4000182f0afebcd41f6ac7baccc6ca58388cfb5498'
        'b673a54133c1c2feaf63a2e74c7f49d9190335afbae19d83c56395224dd201336d6c9895648f947fc4b449336b6c370811a1cca6d21526374b90fbeaff530d2e'
        '5a8b22eefdec54b475dec402b58a432894fa5696b50493a90569e1179d0a4242bc3efd2a514ee71cb6beb60b70789ebce65fc2c1815ae4144ae51814654015bf'
        '6e0d8f0742e36310fbdbc551426df1e88bb3eca9bed34a8ab12a8dceb74c61efc957e3e52b22a51706353a82188bba841cbbc9369bb793632c97f816e8965b65')

pkgver() {
    cd "$srcdir/zeroclaw"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/zeroclaw"

    # Apply voice-wake subject fix patch
    # patch -Np1 -i "$srcdir/voice-wake-subject.patch"

    # Apply type mismatch fix patch
    patch -Np1 -i "$srcdir/fix-type-mismatch.patch"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir/.cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    # Install frontend dependencies
    cd web
    npm ci
    cd ..

    # Workaround for rustc query depth overflow issues in matrix-rust-sdk
    local msdk_lib
    msdk_lib=$(find "$srcdir/.cargo-home/registry/src" -path '*/matrix-sdk-*/src/lib.rs' 2>/dev/null | head -1)
    if [[ -n "$msdk_lib" ]] && ! grep -q 'recursion_limit' "$msdk_lib"; then
        sed -i '1s/^/#![recursion_limit = "256"]\n/' "$msdk_lib"
    fi
}

build() {
    cd "$srcdir/zeroclaw"
    export RUSTUP_TOOLCHAIN=stable
    # zeroclaw requires clang; gcc will not compile successfully
    export CC=clang
    export CXX=clang++
    export CARGO_HOME="$srcdir/.cargo-home"

    # Compile the frontend assets first
    cargo run -p xtask --bin web -- build

    # aws-lc-sys/jitterentropy requires -O0 but Arch injects -O2 via CFLAGS;
    # unsetting prevents the C build from failing with 'timing not safe'
    unset CFLAGS CXXFLAGS

    # Extract all features from Cargo.toml's [features] section
    local all_features
    all_features=$(awk '/^\[features\]/{p=1;next} /^\[/{p=0} p && /^[a-z][a-z0-9_-]* *=/{sub(/ *=.*/,"");print}' Cargo.toml)

    # Define features to exclude (meta-features, deprecated aliases, and simulation features)
    local exclude="default ci-all fantoccini landlock metrics dev-sim"

    local features=""
    local feat
    for feat in $all_features; do
        # Skip if in exclude list
        if [[ " $exclude " == *" $feat "* ]]; then
            continue
        fi
        # Skip Raspberry Pi features on non-ARM architectures
        if [[ "$feat" == "peripheral-rpi" ]] && [[ "$CARCH" != "aarch64" ]] && [[ "$CARCH" != "armv7h" ]]; then
            continue
        fi
        features="${features:+$features,}$feat"
    done

    cargo build \
        --release \
        --frozen \
        --features "$features"
}

package() {
    cd "$srcdir/zeroclaw"
    install -Dm755 "target/release/zeroclaw" "$pkgdir/usr/bin/zeroclaw"
    install -Dm755 "target/release/zeroclaw-acp-bridge" "$pkgdir/usr/bin/zeroclaw-acp-bridge"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    # system service
    install -Dm644 "$srcdir/zeroclaw.service" "$pkgdir/usr/lib/systemd/system/zeroclaw.service"
    install -Dm644 "$srcdir/zeroclaw-gateway.service" "$pkgdir/usr/lib/systemd/system/zeroclaw-gateway.service"
    # user service
    install -Dm644 "$srcdir/zeroclaw-user.service" "$pkgdir/usr/lib/systemd/user/zeroclaw.service"
    # system user and state directory
    install -Dm644 "$srcdir/zeroclaw.sysusers" "$pkgdir/usr/lib/sysusers.d/zeroclaw.conf"
    install -Dm644 "$srcdir/zeroclaw.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/zeroclaw.conf"
}
