# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Yamashiro <dev cosmicheron com>

_pkgbase='yamagi-quake2'
pkgname="${_pkgbase}-git"
pkgver='8.50.r1.ge8e0f678'
pkgrel='1'
pkgdesc='Enhanced Quake II engine optimized for modern systems (development version)'
url='https://www.yamagi.org/quake2/'
arch=('i686' 'x86_64' 'aarch64')
license=('Info-ZIP' 'GPL-2.0-only')
depends=('glibc' 'sdl3')
optdepends=(
    'quake2-demo: shareware data files'
    'openal: alternative audio backend'
    'curl: http download support'
)
makedepends=('openal' 'mesa' 'curl')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install="${_pkgbase}.install"
source=(
    "${_pkgbase}::git+https://github.com/yquake2/yquake2.git"
    "${_pkgbase}.desktop"
)
b2sums=(
    'SKIP'
    'bfd3220b0bf1a59cac844940d6d7953f5e0de03e5444d8e3c1e2f6260882cc46409c40ec2d1e54fd62a1163c8f287d7394419566952711df2c31a9ddcb385000'
)

pkgver() {
    cd "$_pkgbase"
    git describe --long --tags | sed 's/^QUAKE2_//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make -C "$_pkgbase" WITH_RPATH=no WITH_SYSTEMWIDE=yes WITH_SDL3=yes
}

package() {
    cd "$_pkgbase"

    # client + server binaries, renderer libraries
    install -Dm755 -t "${pkgdir}/usr/lib/${_pkgbase}" release/{quake2,q2ded}
    install -Dm644 -t "${pkgdir}/usr/lib/${_pkgbase}" release/*.so

    # symlinks to make the commands available
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgbase}/quake2" "${pkgdir}/usr/bin/${_pkgbase}"
    ln -s "/usr/lib/${_pkgbase}/q2ded" "${pkgdir}/usr/bin/yamagi-q2ded"

    # game library
    install -Dm644 -t "${pkgdir}/usr/lib/${_pkgbase}/baseq2" 'release/baseq2/game.so'

    # shared game directory
    install -d "${pkgdir}/usr/share/games/quake2"
    echo "You can put Quake 2 game files here." >"${pkgdir}/usr/share/games/quake2/README"

    # doc
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" 'stuff/yq2.cfg' doc/*.md

    # desktop entry
    install -Dm644 -t "${pkgdir}/usr/share/applications" "../${_pkgbase}.desktop"
    install -Dm644 'stuff/icon/Quake2.png' "${pkgdir}/usr/share/pixmaps/${_pkgbase}.png"

    # licenses
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
