# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=tulip
pkgver=5.1.0
pkgrel=1
pkgdesc='Tulip is an information visualization framework dedicated to the analysis and visualization of relational data.'
arch=( 'i686' 'x86_64' 'armv6' 'armv6h' 'arm7h' )
url='http://tulip.labri.fr/'
license=('GPL')
depends=(
    'qt4'
    'libjpeg'
    'libpng'
    'zlib'
    'glew'
    'libxml2'
    'freetype2'
    'qtwebkit'
    )
makedepends=(
    'cmake'
    )
source=(
    "https://sourceforge.net/projects/auber/files/tulip/tulip-${pkgver}/tulip-${pkgver}_src.tar.gz"
    #"tulip-svn::svn+http://svn.code.sf.net/p/auber/code/"
    )
md5sums=('f29fc38efe91e2402adbffea695bd794')
sha1sums=('9d615400cd9b854547698cb5efb231c7dbef7e63')

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

#pkgver() {
#    pkgver_git
#}

prepare()
{
    #cd "${srcdir}/${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p build && cd build && \
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DBUILD_STATIC_LIBS=OFF \
        ..
}

build()
{
    #cd "${srcdir}/${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"

    cd build && \
    make -j $(cat /proc/cpuinfo | grep processor | wc -l | awk '{print $0 + 1;}')
}

verify_build()
{
    #cd "${srcdir}/${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"

}

package()
{
    #cd "${srcdir}/${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"

    cd build && \
    make DESTDIR="${pkgdir}" install
}
