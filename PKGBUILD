# Maintainer: taotieren <admin@taotieren.com>

pkgname=bilibili-manga-watermark-remover
pkgver=0.9.0
pkgrel=1
pkgdesc="bilibili漫画 哔哩哔哩漫画 B漫 去水印工具(无痕 无损)，带图形界面"
arch=($CARCH)
url="https://github.com/lanyeeee/bilibili-manga-watermark-remover"
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
sha256sums=('48b8c9795c66a7b35ed2060c4d45648c70433e8f29b4e7f033f2da85071f4ad6')

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
