# Maintainer: disarmer mk <disarmer.mk@gmail.com>

_name=teeworlds-mkrace
pkgname=$_name
pkgver=git
pkgrel=1
pkgdesc="A 2D multiplayer arcade - mkrace client modification"
arch=('i686' 'x86_64')
url="http://disarmer.ru/mkrace/"
license=('custom')
depends=('mesa' 'sdl' 'freetype2' 'glu')
makedepends=('git' 'python2' 'binutils' 'gcc' 'make' 'fakeroot')
replaces=('teewars')
conflicts=($_name)
provides=($_name)
source=($pkgname::git://github.com/ftk/XXLDDRace.git
        mkrace.desktop)
md5sums=('SKIP'
         '21491a50c4161f7a65ef9998334a6852')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --always | sed 's|-|.|g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    #patch -p1 -i "${srcdir}/set-data-dir.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    PYTHON=python2 make -f Makefile.unix -j 4
}

package() {
    cd "${srcdir}/${pkgname}"
    mkdir -p "${pkgdir}"/usr/share/${_name}/data
    cp -r "${srcdir}"/${pkgname}/data/* "${pkgdir}"/usr/share/${_name}/data

    install -Dm755 "${srcdir}"/${pkgname}/XXLDDRace "${pkgdir}"/usr/bin/mkrace
    install -Dm755 "${srcdir}"/${pkgname}/XXLDDRace-Server "${pkgdir}"/usr/bin/mkrace-server

    install -Dm644 "${srcdir}"/mkrace.desktop "${pkgdir}"/usr/share/applications/mkrace.desktop
    install -Dm644 "${srcdir}"/${pkgname}/other/icons/dddrace.ico "${pkgdir}"/usr/share/pixmaps/mkrace.png
    install -Dm644 "${srcdir}"/${pkgname}/license.txt "${pkgdir}"/usr/share/licenses/${_name}/license.txt
    install -Dm644 "${srcdir}"/${pkgname}/license_DDRace.txt "${pkgdir}"/usr/share/licenses/${_name}/license_mkrace.txt
}
