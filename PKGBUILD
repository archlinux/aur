# Maintainer: taotieren <admin@taotieren.com>

pkgname=picacomic-downloader
pkgver=0.5.0
pkgrel=4
pkgdesc="哔咔漫画 picacomic pica漫画 bika漫画 PicACG 多线程下载器，带图形界面，已打包exe，带收藏夹，下载速度飞快"
arch=($CARCH)
url="https://github.com/lanyeeee/picacomic-downloader"
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
sha256sums=('865f5c1866a5823d3bf5c3421393073fa0218c7eec12ba172ee61764f07f5f38')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/src-tauri"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

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
#     cd "${srcdir}/${pkgname}-${pkgver}/"
#     cargo test --release --all-features
# }

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    install -Dvm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
    install -Dvm755 src-tauri/target/release/${pkgname} -t ${pkgdir}/usr/bin
    install -Dvm644 src-tauri/icons/icon.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Categories=
Comment=${pkgdesc}
Exec=picacomic-downloader
Icon=picacomic-downloader.png
Name=picacomic-downloader
Terminal=false
Type=Application

EOF
}
