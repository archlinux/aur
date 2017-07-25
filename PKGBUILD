# Maintainer: Andrei Alexeyev <akari@alienslab.net>

pkgname=rexuiz-git
pkgver=r78.ce815fa
pkgrel=1
arch=('any')
pkgdesc="An updated fork of Nexuiz, a fast-paced multiplayer first-person shooter."
url="http://rexuiz.top/"
license=("GPL2")
depends=(
    'nexuiz-data'
    'rexuiz-bytecode-git'
    'darkplaces-rm-git'
    'curl'
    'freetype2'
    'libjpeg'
    'libpng'
    'libtheora'
    'libvorbis'
)
makedepends=(
    'make'
    'zip'
    'unzip'
)
optdepends=(
    'libircclient: IRC integration (server-side)'
    'libmaxminddb: scoreboard country flags support (server-side)'
)
conflicts=('rexuiz')
provides=('rexuiz')
source=(
    "git+https://github.com/kasymovga/rexuiz"
    "https://raw.githubusercontent.com/kasymovga/RexuizLauncher/master/src/resources/icon.png"
    "rexuiz.sh"
)
sha256sums=(
    'SKIP'
    'a5ebbae57d6375693bdeae8b71047c8b6a3b6b2b4038614c31c97092c6d0a508'
    '75b3a530887e79582fd352b4afd8f9b03194d36a4babd53ee0ae48db12c01e5b'
)

build() {
    cd "${srcdir}/rexuiz"

    cd rexuiz.pk3 || return 1
    rm -f "${srcdir}/rexuiz.pk3" || return 1
    zip -r --exclude=*.dat "${srcdir}/rexuiz.pk3" . || return 1
    rm -f "${srcdir}/csprogs.dat" || return 1
    unzip -j /usr/share/nexuiz/data/data20091001.pk3 csprogs.dat -d "${srcdir}" || return 1
}

package() {
    cd "${srcdir}"

    install -Dm644 rexuiz/scripts/rexuiz.desktop "${pkgdir}/usr/share/applications/rexuiz.desktop"
    install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/rexuiz.png"

    install -Dm644 rexuiz.pk3 "${pkgdir}/usr/share/rexuiz/data/10-rexuiz-data.pk3"
    install -Dm644 csprogs.dat "${pkgdir}/usr/share/rexuiz/data/dlcache/csprogs.dat.408476.61283"
    ln -s  ../../nexuiz/data/data20091001.pk3 "${pkgdir}/usr/share/rexuiz/data/00-nexuiz-data.pk3"
    ln -s  ../../nexuiz/data/common-spog.pk3 "${pkgdir}/usr/share/rexuiz/data/00-nexuiz-common-spog.pk3"

    install -Dm755 rexuiz.sh "${pkgdir}/usr/bin/rexuiz"
    ln -s rexuiz "${pkgdir}/usr/bin/rexuiz-server"
}

pkgver() {
    cd "${srcdir}/rexuiz"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
