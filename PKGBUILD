# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin, Yamashiro <dev cosmicheron com>

pkgname='yamagi-quake2'
pkgver='8.60'
pkgrel='1'
pkgdesc='Enhanced Quake II engine optimized for modern systems'
url='https://www.yamagi.org/quake2/'
arch=('i686' 'x86_64' 'aarch64')
license=('Info-ZIP' 'GPL-2.0-only')
depends=('glibc' 'libglvnd' 'sdl3')
optdepends=('curl: http download support'
    'openal: alternative audio backend'
    'quake2-data: game files'
    'quake2-demo: shareware data files')
makedepends=('openal' 'mesa' 'curl')
install="${pkgname}.install"
source=("https://deponie.yamagi.org/quake2/quake2-${pkgver}.tar.xz"
    "${pkgname}.desktop")
b2sums=(
    '96917bc78c1f1aeffed1e7b471ed96ed80826ee8f8fe0b44e290b0dd180e49bc43ee70dc0f8632dc1495de3af7aa3b569a99e2112b39d5a52a866d6a71977e7c'
    'bfd3220b0bf1a59cac844940d6d7953f5e0de03e5444d8e3c1e2f6260882cc46409c40ec2d1e54fd62a1163c8f287d7394419566952711df2c31a9ddcb385000'
)

build() {
    make -C "quake2-${pkgver}" WITH_RPATH=no WITH_SYSTEMWIDE=yes WITH_SDL3=yes
}

package() {
    cd "quake2-${pkgver}"

    # client + server binaries, renderer libraries
    install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" release/{quake2,q2ded}
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" release/*.so

    # symlinks to make the commands available
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/quake2" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/usr/lib/${pkgname}/q2ded" "${pkgdir}/usr/bin/yamagi-q2ded"

    # game library
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/baseq2" 'release/baseq2/game.so'

    # shared game directory
    install -d "${pkgdir}/usr/share/games/quake2"
    echo "You can put Quake 2 game files here." >"${pkgdir}/usr/share/games/quake2/README"

    # doc
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'stuff/yq2.cfg' doc/*.md

    # desktop entry
    install -Dm644 -t "${pkgdir}/usr/share/applications" "../${pkgname}.desktop"
    install -Dm644 'stuff/icon/Quake2.png' "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # licenses
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
