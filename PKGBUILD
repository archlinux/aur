# Maintainer: Yunhui Fu <yhfudev@gmail.com>

_pkgbase="u8glib-git"
#pkgname=('libu8gwpi-git' 'libu8gsdl-git')
pkgname=('u8glib-git')
pkgver=2efa3aa
pkgrel=1
pkgdesc="Universal Graphics Library for 8 Bit Embedded Systems"
arch=( 'i686' 'x86_64' 'armel' 'armhf' )
url='http://code.google.com/p/u8glib/'
license=('BSD')
depends=('wiringpi-git')
makedepends=('wiringpi-git')
#conflicts=('libu8gwpi-git' 'libu8gsdl-git')

source=("${_pkgbase}::git+https://github.com/yhfudev/u8glib.git"
    autoclean.sh
    autogen.sh
    configure.ac
    Makefile.am
    Printable.h
    Print.h
    WString.h
    wpimain.cpp
    u8glib-hg-automake.patch
    )
md5sums=('SKIP'
    b69ad754ec4ee727f9176d67729957ed  # autoclean.sh
    a365f85909306565a791091cd3f72581  # autogen.sh
    971e68a376117a4dfa54c497378217ff  # configure.ac
    fd028df31fd1240f522927bda525af89  # Makefile.am
    0fe78d8a3c557d144ba1b644f07f4697  # nonarduino/Printable.h
    27ed87162d28c5a16128df5ff232f8a9  # nonarduino/Print.h
    a27c0b55ca396d7b53d77dcfb0f5460e  # nonarduino/WString.h
    238d6c7f801a600ee6ce05cc7a54e7d8  # nonarduino/wpimain.cpp
    32b2bb35158432c229f33bb44f542ca9  # u8glib-hg-automake.patch
    )

pkgver_git() {
    cd "${srcdir}/${_pkgbase}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${_pkgbase}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver() {
    pkgver_git
}

prepare() {
    cd "${srcdir}/${_pkgbase}"
    mkdir -p nonarduino
    cp "${srcdir}/Printable.h"  nonarduino
    cp "${srcdir}/Print.h"      nonarduino
    cp "${srcdir}/WString.h"    nonarduino
    cp "${srcdir}/wpimain.cpp"  nonarduino
    cp "${srcdir}/autoclean.sh" .
    cp "${srcdir}/autogen.sh" .
    cp "${srcdir}/configure.ac" .
    cp "${srcdir}/Makefile.am" .
    patch -p1 -i "${srcdir}/u8glib-hg-automake.patch"
}

build() {
    cd "${srcdir}/${_pkgbase}"
    ./autogen.sh
    ./configure --prefix=/usr
    make $MAKEFLAGS
}

check() {
    make -C "${srcdir}/${_pkgbase}" check
}

package() {
    cd "${srcdir}/${_pkgbase}"
    make DESTDIR="$pkgdir" install
}

package_libu8gwpi-git() {
    conflicts=('libu8gwpi')
    provides=('libu8gwpi')
    #replaces=('libu8gwpi-git')

    cd "${srcdir}/${_pkgbase}"
    make DESTDIR="$pkgdir" install
}

package_libu8gsdl-git() {
    pkgdesc='Python 2 bindings for Google Protocol Buffers'
    #depends=('libu8g')
    conflicts=('libu8gsdl-git')
    provides=('libu8gsdl')
}
