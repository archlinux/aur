# Maintainer: taotieren <admin@taotieren.com>

pkgname=picacomic-downloader
pkgver=0.6.1
pkgrel=1
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
    openssl
    webkit2gtk-4.1
)
makedepends=(
    cargo
    cargo-tauri
    git
    pnpm
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('2f78fed7bf1413a15eec734acab0f4702b68a912c0690e7914251eeacb6048f7')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/src-tauri"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
Exec=picacomic-downloader
Icon=picacomic-downloader.png
Name=picacomic-downloader
Terminal=false
Type=Application

EOF
}
