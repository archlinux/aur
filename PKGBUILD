# Maintainer: taotieren <admin@taotieren.com>

pkgname=airisp-next-git
pkgver=0.2.0.r0.g23010ec
pkgrel=8
pkgdesc="An ISP tool for Air MCU (Rust)"
arch=($CARCH)
url="https://github.com/Air-duino/AirISP-next"
license=('custom')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    cairo
    gcc-libs
    gdk-pixbuf2
    glibc
    glib2
    gtk3
    libsoup
    pango
    systemd-libs
    hicolor-icon-theme
    libusb
    webkit2gtk)
makedepends=(
    cargo
    cargo-tauri
    #     gendesk
    git
    hidapi
    libayatana-appindicator
    librsvg
    rust
    #     npm
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
    cd "${srcdir}/${pkgname}/src-tauri"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
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
    # Install your project files into the package directory
    #     install -Dm644 package.json "$pkgdir/usr/share/$pkgname/package.json"
    #     install -Dm644 dist/* -t "$pkgdir/usr/share/$pkgname/dist/"

    # Create a symlink to your executable
    #     ln -s "/usr/share/$pkgname/dist/AirISP-next" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm0755 src-tauri/target/release/AirISP-next "$pkgdir/usr/bin/${pkgname%-git}"
    # icon
    #     local _icon
    #     for _icon in 32 128; do
    #         install -Dm0644 src-tauri/icons/${_icon}x${_icon}.png \
    #             ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname%-git}.png
    #     done

    # desktop file
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
    #     gendesk -q -f -n --pkgname="${pkgname%-git}" --name="${pkgname%-git}" --comment="${pkgdesc}" --categories="Development;Utility" --exec="${pkgname%-git}" --icon="${pkgname%-git}.png"
    #     install -Dm0644 "${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}
