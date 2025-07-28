# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname=rdapcheck
pkgver=0.1.1
_pkgver_denort=2.2.10
pkgrel=2
pkgdesc="A simple RDAP library and command-line tool to check domain name availability in bulk."
arch=('x86_64' 'aarch64')
url="https://github.com/Gadiguibou/rdapcheck"
license=('AGPL-3.0')
makedepends=('deno')
options=('!strip')
provides=('rdapcheck')
conflicts=('rdapcheck')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://dl.deno.land/release/v${_pkgver_denort}/denort-x86_64-unknown-linux-gnu.zip")
sha256sums=('c636b18a800ce078da5f564c97f2151d117d4aa1afda681f984563a2034c3824'
            'e943e07d9e68849537874691286840ec592617f084cc73e32e40904279a23c97')

prepare() {
    # Prevent deno from downloading denort on its own by creating its cache and populating it.
    # This respects Arch Linux packaging guidelines and common security practices.
    export DENO_DIR="${srcdir}/.deno_cache"
    mkdir -p "$DENO_DIR/dl/release/v${_pkgver_denort}"
    mv "denort-x86_64-unknown-linux-gnu.zip" "$DENO_DIR/dl/release/v${_pkgver_denort}"
}

build() {
    cd "${pkgname}-${pkgver}"
    deno compile \
                 --cached-only \
                 --no-remote \
                 --allow-net \
                 --output "${pkgname}" \
                 src/cmd.ts
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
