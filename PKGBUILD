# Maintainer: Neko-san <nekoNexus at protonmail dot ch>

_pkgname=ukmm
pkgname=${_pkgname}-git
pkgver=0.6.0.r11.gaacbabe
pkgrel=0
pkgdesc="U-King Mod Manager is a tool for managing and merging mods for The Legend of Zelda: Breath of the Wild."
arch=('any')
url="https://github.com/NiceneNerd/${_pkgname}"
license=('GPL3')
depends=('gtk3')
makedepends=('cargo' 'git')
optdepends=()
source=("git+${url}"
        UKMM.desktop)
sha256sums=('SKIP'
            '921de35b2a4518ca9f89c1a8020cc1c3bafc24abb559ffb3cf5a1091d61d8aef')
options=('!lto' '!strip' 'debug')

prepare() {
    cd "$srcdir/${_pkgname}" || return
    cargo fetch --locked --target "$(uname -m)-unknown-linux-gnu"
}

pkgver() {
    cd "${_pkgname}" || return
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/${_pkgname}" || return
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    export DEBUG_RUSTFLAGS="-C debuginfo=2 ${DEBUG_RUSTFLAGS}"
    cargo build --release
}

package() {
    cd "${srcdir}/${_pkgname}" || return
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "assets/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 ../UKMM.desktop "${pkgdir}/usr/share/applications/UKMM.desktop"
    cd "${srcdir}/.." || return
    rm -rf "${srcdir}"
}
