# Maintainer: taotieren <admin@taotieren.com>

pkgname=hslinkupper
_name=HSLinkUpper
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="HSLinkUpper is a simple tool that allows you to config HSLink."
arch=($CARCH)
url="https://github.com/HSLink/HSLinkUpper"
license=(MIT)
groups=()
provides=(${pkgname} hslink-upper)
conflicts=(${pkgname} hslink-upper)
depends=(
    cairo
    gdk-pixbuf2
    gcc-libs
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libsoup3
    pango
    systemd-libs
    webkit2gtk-4.1
)
makedepends=(
    hidapi
    pnpm
    rust
    cargo-tauri
)
optdepends=()
checkdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('a8190bb1202d426582779d8568c30833675074e3ba5a405bb3b68ad347a53146')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}/src-tauri"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"

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
#     cd "${srcdir}/${pkgname}"
#     cargo test -- --release --all-features
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    #     tar xpf src-tauri/target/release/bundle/deb/${pkganame}_${pkgver}_amd64/data.tar.gz -C ${pkgdir}
    #     chown -R root:root ${pkgdir}
    install -Dvm644 99-hslink.rules -t ${pkgdir}/usr/lib/udev/rules.d/
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
    install -Dm755 src-tauri/target/release/hslinkupper ${pkgdir}/usr/bin/${pkgname%-git}
    install -Dm644 src-tauri/icons/128x128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png
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
