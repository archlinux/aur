# Maintainer: taotieren <admin@taotieren.com>

pkgname=tinyget-ui-git
pkgver=r10.d8ecddb
pkgrel=1
epoch=
pkgdesc="Tinyget is a Python package management tool, handling mainstream system package managers such as apt (used in Debian, Ubuntu, etc.), dnf (used in Fedora, CentOS, etc.) and pacman (used in ArchLinux, etc.)."
arch=('any')
url="https://gitee.com/tinylab/tinyget-ui"
license=(GPL-2.0-or-later)
groups=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    cairo
    dbus
    gdk-pixbuf2
    gcc-libs
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libsoup
    protobuf-c
    webkit2gtk
    # AUR
    #     tinyget
)
makedepends=(
    git
    gettext
    pnpm
    openssh
    cargo
    cargo-tauri
    libayatana-appindicator

)
optdepends=('tinyget: A cross-distro package management tool.')
checkdepends=()
options=('!strip' '!debug')
source=(${pkgname}::git+$url.git)
noextract=()
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
    cd "${srcdir}/${pkgname}"

    export PNPM_HOME="$HOME/.local/share/pnpm"
    export PATH="$PNPM_HOME:$PATH"
    mkdir -p "$PNPM_HOME"
    pnpm setup
    pnpm install
    mkdir -pv dist
    cd src-tauri
    cargo build --release --all-features

}

# check() {
#     cd "${srcdir}/${pkgname}"
#     cargo test -- --release --all-features
# }

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 src-tauri/target/release/tinyget_ui ${pkgdir}/usr/bin/${pkgname%-git}
    install -Dm644 src-tauri/icons/android-chrome-512x512.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-git}.png
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
