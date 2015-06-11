# Maintainer: Lael Guillemenot <zeppelinlg@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_name=teeworlds
pkgname=$_name-ddrace-git
pkgver=d289e4d
pkgrel=1
pkgdesc="A 2D multiplayer arcade (Git version)"
arch=('i686' 'x86_64')
url="http://ddrace.info"
license=('custom')
depends=('mesa' 'sdl' 'freetype2' 'glu')
makedepends=('python' 'git' 'bam')
replaces=('teewars')
conflicts=($_name)
provides=($_name)
source=($pkgname::git://github.com/DDRace/teeworlds.git
        DDRace.desktop
        set-data-dir.patch)
md5sums=('SKIP'
         'f41ee1b3dfc1a5ccee9308636f3a4b1b'
         'a0910710090b9e5431947d0eae553dda')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --always | sed 's|-|.|g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 -i "${srcdir}/set-data-dir.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    /usr/bin/bam release
}

package() {
    cd "${srcdir}/${pkgname}"
    mkdir -p "${pkgdir}"/usr/share/${_name}/data
    cp -r "${srcdir}"/${pkgname}/data/* \
       "${pkgdir}"/usr/share/${_name}/data

    install -Dm755 "${srcdir}"/${pkgname}/DDRace \
       "${pkgdir}"/usr/bin/DDRace
    install -Dm755 "${srcdir}"/${pkgname}/DDRace-Server \
       "${pkgdir}"/usr/bin/DDRace-Server

    install -Dm644 "${srcdir}"/DDRace.desktop \
       "${pkgdir}"/usr/share/applications/DDRace.desktop
    install -Dm644 "${srcdir}"/${pkgname}/other/icons/DDRace2.ico \
       "${pkgdir}"/usr/share/pixmaps/DDRace.png
    install -Dm644 "${srcdir}"/${pkgname}/license.txt \
       "${pkgdir}"/usr/share/licenses/${_name}/license.txt
    install -Dm644 "${srcdir}"/${pkgname}/license_DDRace.txt \
       "${pkgdir}"/usr/share/licenses/${_name}/license_DDRace.txt
}
