# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: shimi <shimi.chen@gmail.com>

_pkgname=imagewriter
pkgname="${_pkgname}-git"
pkgver=20201109
pkgrel=1
pkgdesc="A graphical utility for writing raw disk images & hybrid ISOs to USB keys. QT5 GIT release."
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/${_pkgname}"
license=('GPL2')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'qt5-base' 'udisks2')
makedepends=('git')
optdepends=("xdg-su: needed for non-KDE users"
	    "kdesu: needed for KDE")
conflicts=("imagewriter")
source=(git+https://github.com/frispete/imagewriter)
#("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

prepare() {
    if [ -e /usr/bin/kdesu ]
        then sed 's/\/usr\/bin\/xdg-su -c \/usr\/bin\//kdesu /' -i ${srcdir}/${_pkgname}/${_pkgname}.desktop
        else sed 's/\/usr\/bin\/xdg-su -c \/usr\/bin\//xdg-su -s /' -i ${srcdir}/${_pkgname}/${_pkgname}.desktop
    fi
}

build() {
    cd ${srcdir}/${_pkgname}
    CFLAGS="$CFLAGS -DKIOSKHACK"
    qmake-qt5 PREFIX="${pkgdir}/usr" DEFINES=USEUDISKS2 ${_pkgname}.pro
    make
}

package() {
    cd ${srcdir}/${_pkgname}
    make DESTDIR="${pkgdir}/" install
}
