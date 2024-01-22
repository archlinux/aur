# Maintainer: taotieren <admin@taotieren.com>

pkgname=airisp-next-git
pkgver=0.2.0.r0.g23010ec
pkgrel=2
pkgdesc="An ISP tool for Air MCU (Rust)"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/Air-duino/AirISP-next"
license=('unknow')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(cargo
    gtk3
    hidapi
    hicolor-icon-theme
    libayatana-appindicator
    librsvg
    libusb
    openssl
    webkit2gtk
    systemd)
makedepends=(
    cargo-tauri
    gendesk
    git
    rust
    npm
    pnpm
    pkgconf
    mold)
backup=()
options=('!strip' '!lto')
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
#     mold -run cargo build --release --all-features
    pnpm install
    pnpm tauri build
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
    install -Dm0755 src-tauri/target/release/air-isp-next "$pkgdir/usr/bin/${pkgname%-git}"
# icon
    local _icon
    for _icon in 32 128; do
        install -Dm0644 src-tauri/icons/${_icon}x${_icon}.png \
            ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname%-git}.png
    done

# desktop file
    gendesk -q -f -n --pkgname="${pkgname%-git}" --name="${pkgname%-git}" --comment="${pkgdesc}" --categories="Development;Utility"  --exec="${pkgname%-git}" --icon="${pkgname%-git}.png"
	install -Dm0644 "${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}
