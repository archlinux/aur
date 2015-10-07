# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=libmirisdr-git
pkgver=59ba372
pkgrel=1
pkgdesc="Software for the Mirics MSi2500 + MSi001 SDR platform."
arch=('i686' 'x86_64' 'arm')
url="http://cgit.osmocom.org/libmirisdr/"
license=('GPL')
depends=(
    )
makedepends=(
    'git'
    'cmake'
    )
#optdepends=()
provides=('libmirisdr')

source=("${pkgname}::git://git.osmocom.org/libmirisdr")
md5sums=('SKIP')

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver() {
    pkgver_git
}

build() {
    cd "$srcdir/${pkgname}"
    mkdir -p build
    cd build
    cmake -DLIB_INSTALL_DIR=${pkgdir}/usr/lib/$(DEB_HOST_MULTIARCH) -DCMAKE_INSTALL_PREFIX=/usr ../
    make
}

package() {
    cd "$srcdir/${pkgname}/build/"
    make DESTDIR=${pkgdir} install
    mkdir -p "${pkgdir}/etc/udev/rules.d/"
    cp "$srcdir/${pkgname}/mirisdr.rules" "${pkgdir}/etc/udev/rules.d/99-mirisdr.rules"
}

# vim:set ts=2 sw=2 et:
