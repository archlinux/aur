# Maintainer: Yunhui Fu <yhfudev@gmail.com>

_pkgbase="ucglib-git"
#pkgname=('libucgsdl-git' 'libucgwpi-git')
pkgname=('ucglib-git')
pkgver=59e157e
pkgrel=1
pkgdesc="Color graphics library for embedded systems"
arch=( 'i686' 'x86_64' 'armv5tel' 'armv7l' )
url='https://github.com/olikraus/ucglib.git'
license=('BSD')
depends=('wiringpi-git')
makedepends=('wiringpi-git')
#conflicts=('libucgsdl-git' 'libucgwpi-git')

source=("${_pkgbase}::git+https://github.com/yhfudev/ucglib.git"
    )
md5sums=('SKIP'
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

package_libucgwpi-git() {
    conflicts=('libucgwpi')
    provides=('libucgwpi')
    #replaces=('libucgwpi-git')

    cd "${srcdir}/${_pkgbase}"
    make DESTDIR="$pkgdir" install
}

package_libucgsdl-git() {
    pkgdesc='P'
    #depends=('libucg')
    conflicts=('libucgsdl-git')
    provides=('libucgsdl')
}
