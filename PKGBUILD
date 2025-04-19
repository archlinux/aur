# Maintainer: taotieren <admin@taotieren.com>

pkgbase=hslinkupper
pkgname=hslinknexus
_name=HSLinkNexus
pkgver=1.2.1
pkgrel=3
epoch=
pkgdesc="HSLinkUpper is a simple tool that allows you to config HSLink."
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
    npm
    pnpm
    rust
    cargo-tauri
)
optdepends=()
checkdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('154c9e804091008160a53e09dbe1f3752dfdbfaf98c1cf6c9543ca872300f5f0')

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

    install -Dvm644 99-hslink.rules -t ${pkgdir}/usr/lib/udev/rules.d/
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
    install -Dm755 src-tauri/target/release/${pkgname} ${pkgdir}/usr/bin/${pkgname}
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
