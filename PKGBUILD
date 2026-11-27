# Maintainer: taotieren <admin@taotieren.com>

pkgname=hghub
pkgver=0.0.5
pkgrel=1
pkgdesc="Plug-in media player"
arch=($CARCH)
url="https://github.com/Minireel/HGhub"
license=('PolyForm-Noncommercial-1.0.0')
provides=(${pkgname})
conflicts=(${pkgname})
# replaces=(${pkgname})
depends=(
    cairo
    dbus
    gdk-pixbuf2
    glib2
    gtk3
    hicolor-icon-theme
    libgcc_s.so
    libsoup3
    webkit2gtk-4.1
)
makedepends=(
    rust
    git
    cargo-tauri
    pnpm
    nodejs
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('b970714eafcc1a576fc929c793afaacc6f779f750ac5e0bb3b6f310701437993')

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
    install -Dvm755 src-tauri/target/release/*client ${pkgdir}/usr/bin/${pkgname}
    install -Dvm644 src-tauri/icons/icon.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png
    install -Dvm644 public/logo.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png
    install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Categories=
Comment=${pkgdesc}
Comment[zh_CN]=HGhub · 插件视频播放器
Exec=${pkgname}
Icon=${pkgname}
Name=${pkgname}
Terminal=false
Type=Application

EOF
}
