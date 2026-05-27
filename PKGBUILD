# Maintainer: taotieren <admin@taotieren.com>

pkgname=manhuagui-downloader
pkgver=0.5.0
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
    libsoup3
    openssl
    webkit2gtk-4.1
)
makedepends=(
    rust
    cargo-tauri
    git
    pnpm
    patchelf
    nodejs-lts
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('9df27a8d17c8f30df1942e6cefc45d7c84349c5922e4163e638790cf7c71ac88')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/src-tauri"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export CARGO_HOME="${srcdir}/.cargo"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
    } >>.npmrc

    NODE_ENV=development pnpm install --force
    NODE_ENV=production pnpm tauri build -b deb
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#     cargo test --release --all-features
# }

package() {
    cd "${srcdir}/${pkgname}/"

    install -Dvm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
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
