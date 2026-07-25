_system_wasm_bindgen=false
_version=0.5.0
_channel=nightly
_date=2026-07-25

pkgbase=ruffle-nightly
pkgname=(ruffle-nightly
        ruffle-demo-nightly
        ruffle-selfhosted-nightly
        firefox-extension-ruffle-nightly
        chromium-extension-ruffle-nightly)
pkgver="$_version+$_channel+${_date//-}"
pkgrel=1
arch=("x86_64")
pkgdesc="A Flash Player emulator written in Rust. (Nightly version)"
url="https://ruffle.rs/"
license=("MIT OR Apache-2.0")
makedepends=("cargo" "cmake" "java-environment" "npm" "nodejs-lts-jod"
             "binaryen" "gtk3" "alsa-lib" "libxcb" "systemd-libs"
             "clang" "jq" "git" "openssl" "rust-wasm" "rust-src")
if "$_system_wasm_bindgen"
then
    makedepends+=("wasm-bindgen")
else
    makedepends+=("yq")
fi
source=("git+https://github.com/ruffle-rs/ruffle.git#tag=$_channel-$_date"
        "chromium-extension-ruffle.key")
source=("git+https://github.com/ruffle-rs/ruffle.git#tag=$_channel-$_date")
sha256sums=('a3ee5b5c8c8da522c6857d5342a232b609f474d14873f9dea716b09b9135a984')
options=("!lto")

_FIREFOX_EXTENSION_ID="ruffle@ruffle.rs"

prepare() {
    cd "$srcdir/ruffle"
    export RUSTUP_TOOLCHAIN=stable
    if ! "$_system_wasm_bindgen"
    then
        local require_wasm_bindgen_version
        require_wasm_bindgen_version="$(tomlq -r '.package[] | select(.name == "wasm-bindgen") | .version' Cargo.lock)"
        cargo install wasm-bindgen-cli --version "$require_wasm_bindgen_version"
    fi
    cargo fetch --locked --target host-tuple
    cargo fetch --locked --target wasm32-unknown-unknown
    cd web
    npm ci
    # TODO version_name=$version_number when not nightly
    jq --null-input \
        --arg version_channel "$_channel" \
        --arg version_number "$_version" \
        --arg version_name "$_channel $_date" \
        --arg build_date "$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)" \
        --arg build_id "$pkgrel" \
        --arg commitHash "$(git rev-parse HEAD)" \
        --arg firefox_extension_id "$_FIREFOX_EXTENSION_ID" \
    '$ARGS.named' > version_seal.json
    echo "Generated version_seal.json:"
    cat version_seal.json
}

build() {
    cd "$srcdir/ruffle"
    if ! "$_system_wasm_bindgen"
    then
        export PATH="$PATH:$HOME/.cargo/bin"
    fi
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # libtracy_client-sys seems missing some symbols, skip enabling all features.
    # jpegxr is not compatible to rust 1.94.0
    cargo build --frozen --release \
        --package=ruffle_desktop \
        --package=ruffle_scanner \
        --package=exporter

    # Script will read binary at hardcoded path
    # See web/packages/core/tools/build_wasm.ts for more info.
    unset CARGO_TARGET_DIR
    # Flags does not supported by WASM target:
    # C/CXX: -mtune -march -fcf-protection
    # RUST: -Ctarget-cpu
    CFLAGS="$(echo "$CFLAGS" | sed -E 's/-m(tune|arch)=[0-9a-zA-Z-]+//g;s/-fcf-protection//g')"
    CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's/-m(tune|arch)=[0-9a-zA-Z-]+//g;s/-fcf-protection//g')"
    RUSTFLAGS="$(echo "$RUSTFLAGS" | sed -E 's/\s*-C\s*target-cpu=[0-9a-zA-Z]+//')"

    cd web
    npm run build:repro
}

check() {
    cd "$srcdir/ruffle"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen \
        --package=ruffle_desktop \
        --package=ruffle_scanner \
        --package=exporter

    cd web
    npm run test
}

package_ruffle-nightly() {
    depends=("hicolor-icon-theme" "alsa-lib" "systemd-libs" "gcc-libs" "glibc")
    pkgdesc+=" (Desktop app and utils)"
    provides=("ruffle")
    conflicts=("ruffle")

    cd "$srcdir/ruffle"
    local f
    find target/release -maxdepth 1 -executable -type f | while read -r f
    do
        local target
        target="$(basename "$f")"
        target=${target/_/-}
        if ! [[ "$target" =~ ^ruffle- ]]
        then
            target="ruffle-$target"
        fi
        if [[ "$target" == "ruffle-desktop" ]]
        then
            target="ruffle"
        fi
        echo "Installing $f to $target..."
        install -Dm755 "$f" "$pkgdir/usr/bin/$target"
    done

    install -Dm644 desktop/packages/linux/rs.ruffle.Ruffle.desktop \
        "$pkgdir/usr/share/applications/rs.ruffle.Ruffle.desktop"
    install -Dm644 desktop/packages/linux/rs.ruffle.Ruffle.metainfo.xml \
        "$pkgdir/usr/share/metainfo/rs.ruffle.Ruffle.metainfo.xml"
    install -Dm644 desktop/packages/linux/rs.ruffle.Ruffle.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/rs.ruffle.Ruffle.svg"
    install -Dm644 LICENSE.md \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/ruffle/README.md"
}

package_ruffle-demo-nightly() {
    pkgdesc+=" (Demo web app)"
    arch=("any")
    provides=("ruffle-demo")
    conflicts=("ruffle-demo")

    cd "$srcdir/ruffle"
    mkdir -p "$pkgdir/usr/share/webapps"
    cp -a --no-preserve=ownership \
        web/packages/demo/dist \
        "$pkgdir/usr/share/webapps/ruffle"
    install -Dm644 web/packages/demo/LICENSE_APACHE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_APACHE"
    install -Dm644 web/packages/demo/LICENSE_MIT \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_MIT"
    install -Dm644 web/packages/demo/README.md \
        "$pkgdir/usr/share/doc/ruffle/demo/README.md"
}

package_ruffle-selfhosted-nightly() {
    pkgdesc+=" (JavaScript module)"
    arch=("any")
    provides=("ruffle-selfhosted")
    conflicts=("ruffle-selfhosted")

    cd "$srcdir/ruffle"
    mkdir -p \
        "$pkgdir/usr/lib/node_modules" \
        "$pkgdir/usr/share/licenses/$pkgname"
    cp -a --no-preserve=ownership \
        web/packages/selfhosted/dist \
        "$pkgdir/usr/lib/node_modules/ruffle"
    ln -srfv \
        "$pkgdir/usr/lib/node_modules/ruffle/LICENSE_APACHE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_APACHE"
    ln -srfv \
        "$pkgdir/usr/lib/node_modules/ruffle/LICENSE_MIT" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_MIT"
    install -Dm644 web/packages/selfhosted/README.md \
        "$pkgdir/usr/share/doc/ruffle/selfhosted/README.md"
}

package_firefox-extension-ruffle-nightly() {
    optdepends=("firefox: Load extension in browser.")
    pkgdesc+=" (Unsigned Firefox extension)"
    arch=("any")
    provides=("firefox-extension-ruffle")
    conflicts=("firefox-extension-ruffle")

    cd "$srcdir/ruffle"
    install -Dm644 web/packages/extension/dist/firefox_unsigned.xpi \
        "$pkgdir/usr/lib/firefox/browser/extensions/$_FIREFOX_EXTENSION_ID.xpi"
    install -Dm644 web/packages/extension/LICENSE_APACHE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_APACHE"
    install -Dm644 web/packages/extension/LICENSE_MIT \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_MIT"
}

package_chromium-extension-ruffle-nightly() {
    optdepends=("chromium: Load extension in browser.")
    pkgdesc+=" (Chromium extension)"
    arch=("any")
    provides=("chromium-extension-ruffle")
    conflicts=("chromium-extension-ruffle")

    cd "$srcdir/ruffle"
    local extension_id=donbcfbmhbcapadipfkeojnmajbakjdc # https://chromewebstore.google.com/detail/ruffle-flash-emulator/donbcfbmhbcapadipfkeojnmajbakjdc
    echo  "Installing chromium extension $extension_id..."
    jq --null-input --raw-output \
        --arg external_update_url https://clients2.google.com/service/update2/crx \
        '$ARGS.named' | \
    install -Dm644 "/dev/stdin" \
            "$pkgdir/usr/share/chromium/extensions/$extension_id.json"
    install -Dm644 web/packages/extension/LICENSE_APACHE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_APACHE"
    install -Dm644 web/packages/extension/LICENSE_MIT \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE_MIT"
}
