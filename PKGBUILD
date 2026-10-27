# Maintainer: taotieren <admin@taotieren.com>

pkgname=airisp-next-git
pkgver=0.2.0.r0.g23010ec
pkgrel=10
pkgdesc="An ISP tool for Air MCU (Rust)"
arch=($CARCH)
url="https://github.com/Air-duino/AirISP-next"
license=('custom')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    cairo
    gdk-pixbuf2
    glib2
    gtk3
    libgcc_s.so
    libsoup
    systemd-libs
    hicolor-icon-theme
    libusb
    webkit2gtk
)
makedepends=(
    cargo
    cargo-tauri
    git
    hidapi
    libayatana-appindicator
    librsvg
    nodejs
    rust
    pango
    pnpm
    pkgconf
)
backup=()
options=('!lto' '!debug' '!strip')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    export npm_config_cache="${srcdir}/.npm-cache"
    cd "${srcdir}/${pkgname}"
    pnpm install --no-frozen-lockfile --config.dangerouslyAllowAllBuilds=true
    cd "${srcdir}/${pkgname}/src-tauri"
    cargo update -p webkit2gtk -p tauri -p tauri-build
    # cargo fetch --locked --target host-tuple
    cargo fetch --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    export npm_config_cache="${srcdir}/.npm-cache"
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    pnpm install
    cd src-tauri
    cargo build --release
    #     pnpm tauri build
}

# check() {
#     cd "${srcdir}/${pkgname}/"

#     export RUSTUP_TOOLCHAIN=stable
#     pnpm test
# }

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    install -Dm0755 src-tauri/target/release/AirISP-next "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dvm644 src-tauri/icons/icon.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png
    install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname%-git}.desktop <<EOF
[Desktop Entry]
Categories=
Comment=${pkgdesc}
Exec=${pkgname%-git}
Icon=${pkgname%-git}.png
Name=${pkgname%-git}
Terminal=false
Type=Application

EOF
}
