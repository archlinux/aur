# Maintainer: taotieren <admin@taotieren.com>

pkgbase=sftool-gui
pkgname=sftool-gui
pkgver=1.1.3
pkgrel=1
epoch=
pkgdesc="A user-friendly graphical serial port operation tool for SIFLI series SoC chips."
arch=($CARCH)
url="https://github.com/OpenSiFli/sftool-gui"
license=(MIT)
groups=()
provides=(
    ${pkgname}
    ${pkgname}-bin
)
conflicts=(
    ${pkgname}
    ${pkgname}-bin
)
replaces=()
depends=(
    cairo
    gdk-pixbuf2
    libgcc
    libstdc++
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    libsoup3
    openssl
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
    nodejs
)
optdepends=(
    "sftool: A command-line serial port operation tool for SIFLI series SoC chips."
)
checkdepends=()
options=(!lto !debug)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('992bcf96bf863733e3ad676181200685872d80713939c9335ac3187535d7a661')

prepare() {
    cd "${srcdir}/${pkgname}/src-tauri"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}"

    sed -i \
        -e 's/"createUpdaterArtifacts": true/"createUpdaterArtifacts": false/' \
        -e '/"updater": {/,/}/ s/"active": true,/"active": false,/' \
        -e '/"updater": {/,/}/ s/"pubkey": ".*"/"pubkey": null/' \
        -e '/"updater": {/,/}/ s/"endpoints": \[ "" \]/"endpoints": null/' \
        src-tauri/tauri.conf.json

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
    cd "${srcdir}/${pkgname}"

    # install -Dvm0644 69-hslink.rules -t ${pkgdir}/usr/lib/udev/rules.d/
    install -vDm0644 LICENCE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -vDm0755 src-tauri/target/release/${pkgname%-gui} ${pkgdir}/usr/bin/${pkgname}
    install -vDm0644 src-tauri/icons/128x128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png
    install -vDm0644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Categories=
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}
Name=${pkgname}
Terminal=false
Type=Application

EOF
}
