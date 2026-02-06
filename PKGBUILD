# Maintainer: taotieren <admin@taotieren.com>

pkgname=bilibili-video-downloader
pkgver=0.1.1
pkgrel=1
pkgdesc="哔哩哔哩 bilibili B站 视频 下载器，图形界面 + nfo刮削 + 广告标记 + 字幕下载 + 弹幕下载，轻松将视频加入emby等媒体库"
arch=($CARCH)
url="https://github.com/lanyeeee/bilibili-video-downloader"
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
    git
    cargo-tauri
    pnpm
    nodejs-lts
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('6ff5927c4aa1e137649d48fbf6ada08c15df0d7ee2a48d44d146d1edf34843d3')

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
Exec=${pkgname}
Icon=${pkgname}.png
Name=${pkgname}
Terminal=false
Type=Application

EOF
}
