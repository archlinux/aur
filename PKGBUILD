# Maintainer: taotieren <admin@taotieren.com>

pkgname=bilibili-manga-downloader
pkgver=0.11.1
pkgrel=0
pkgdesc="哔哩哔哩漫画 bilibili漫画 B漫 的多线程下载器，带图形界面、导出cbz"
arch=($CARCH)
url="https://github.com/lanyeeee/bilibili-manga-downloader"
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
sha256sums=('b06971fe352e6fbc1aaf816982e921ba143c1925234fd771b869caccf98d6e6b')

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
