# Maintainer: taotieren <admin@taotieren.com>

pkgname=copymanga-downloader
pkgver=0.4.0
pkgrel=1
pkgdesc="拷贝漫画 copymanga 的多线程下载器，带图形界面，带收藏夹，支持下载下架的漫画，没有每分钟15次API请求的限制，已打包exe，下载速度飞快。 "
arch=($CARCH)
url="https://github.com/lanyeeee/copymanga-downloader"
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
    libsoup3
    webkit2gtk-4.1
)
makedepends=(
    cargo
    cargo-tauri
    pnpm
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b194ad349a899c97ab731ff138abf74083cd6e1d065e36b0cc358d7a3d0ebc0')

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
