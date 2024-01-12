# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Hugo Osvaldo Barrera <hugo ät barrera.io>

pkgname=gog-thimbleweedpark
pkgver=1.0.958.19330
pkgrel=2
epoch=1
pkgdesc='Neo-noir mystery point-and-click adventure set in 1987. GOG version.'
arch=('x86_64')
url='https://www.gog.com/game/thimbleweed_park'
license=('custom')
options=('libtool' 'staticlibs' '!strip')
depends=('libxdmcp' 'libxau' 'gcc-libs' 'glibc' 'libglvnd' 'libx11'
         'libxcb' 'libxext')
makedepends=('lgogdownloader')
source=(
    "thimbleweed_park_en_${pkgver//./_}.sh::gogdownloader://thimbleweed_park/en3installer0"
    'thimbleweedpark.shim'
    'gog-thimbleweedpark.desktop'
)
sha512sums=(
    '93970bcfca4d201abf5858559f0fe33d2d3e18930d10e1c6e1691fee1075d82f5e6f6b51b0200d55276ce1546308ffc8ad9db5bbb5185af90f2caf092a4adf05'
    'e769cb50a03620f41d864c296224e3a3c7bce93613b714590caabb8cd726ccef5f1a08a664a6018ef7fd74a836340ae6165cb0801e86424639adba3513d96d18'
    '8abe889a8e074abc0c88844581cd800fc041fc6987e5b8a52872dc859446be6d749ba9e5c80ead6246965499a01b1c77cd34fb51d4658cd5aef4fb403c6ee437'
)
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar
_gamename='thimbleweedpark'

package() {
    echo >&2 'Packaging the license'
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
        "${srcdir}/data/noarch/docs/End User License Agreement.txt"

    echo >&2 'Packaging game data'
    mkdir -p "${pkgdir}/opt/gog/${_gamename}"
    cp -r --preserve=mode -t "${pkgdir}/opt/gog/${_gamename}" \
        "${srcdir}/data/noarch"/*

    echo >&2 'Packaging game icon'
    install -D -m 644 -T \
        "${srcdir}/data/noarch/support/icon.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    echo >&2 'Packaging executable shim'
    install -D -m 755 -T \
        "${srcdir}/${_gamename}.shim" \
        "${pkgdir}/usr/bin/${_gamename}"

    echo >&2 'Packaging desktop file'
    install -D -m 755 -T \
        "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    echo >&2 'Packaging documentation'
    install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
        "${srcdir}/data/noarch/docs"/*
    install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/support" \
        "${srcdir}/data/noarch/support/support_notice.txt"

    echo >&2 "Note that this version (${pkgver}) supersedes any 2.x release."
}
