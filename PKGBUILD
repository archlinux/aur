# Maintainer: taotieren <admin@taotieren.com>

pkgbase=hslinkupper
pkgname=hslinknexus
_name=HSLinkNexus
pkgver=1.2.3
pkgrel=2
epoch=
pkgdesc="A simple tool that allows you to config HSLink."
arch=($CARCH)
url="https://github.com/HSLink/HSLinkNexus"
license=(MIT)
groups=()
provides=(${pkgname} hslinkupper hslink-nexus hslink-upper)
conflicts=(${pkgname} hslinkupper hslink-nexus hslink-upper)
replaces=(hslinkupper)
depends=(
    cairo
    gdk-pixbuf2
    glib2
    gtk3
    hicolor-icon-theme
    libgcc_s.so
    libstdc++.so
    libsoup3
    pango
    systemd-libs
    webkit2gtk-4.1
)
makedepends=(
    git
    hidapi
    npm
    pnpm
    rust
    cargo-tauri
    nodejs-lts
)
optdepends=()
checkdepends=()
source=("${_name}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('2e6d3fcd5d906a35e1a7950f17b1c5cd22a76d384b6d23feea271f60db1b026a')

prepare() {
    cd "${srcdir}/${_name}/src-tauri"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${_name}"

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
    cd "${srcdir}/${_name}"

    # install -Dvm644 69-hslink.rules -t ${pkgdir}/usr/lib/udev/rules.d/
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
    install -Dm755 src-tauri/target/release/hslinknexus ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 src-tauri/icons/128x128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png
    install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Categories=
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}
Name=HSLink Nexus
Terminal=false
Type=Application

EOF
}
