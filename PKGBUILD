# Maintainer: taotieren <admin@taotieren.com>

pkgname=manhuagui-downloader
pkgver=0.4.1
pkgrel=1
pkgdesc="漫画柜 manhuagui 看漫画 下载器，带图形界面，支持下载隐藏内容、导出PDF"
arch=($CARCH)
url="https://github.com/lanyeeee/manhuagui-downloader"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
# replaces=(${pkgname})
depends=(
    cairo
    gcc-libs
    gdk-pixbuf2
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    librsvg
    libsoup3
    libappindicator-gtk3
    webkit2gtk-4.1
)
makedepends=(
    cargo
    cargo-tauri
    git
    pnpm
    patchelf
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4080d14d706144e7a4cfe6ecd4d19db60c5f98069c0647feeda63ccb6e3e08b4')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/src-tauri"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    pnpm install
    cd src-tauri
    cargo build --release
    #     pnpm tauri build
}

# check() {
#     cd "${srcdir}/${pkgname}-${pkgver}/"
#     cargo test --release --all-features
# }

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    install -Dvm755 src-tauri/target/release/${pkgname} -t ${pkgdir}/usr/bin
    install -Dvm644 src-tauri/icons/icon.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Categories=
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}.png
Name=${pkgname}
Terminal=false
Type=Application

EOF
}
