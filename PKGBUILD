# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Adam Goldsmith <contact@adamgoldsmith.name>
pkgname=libarcus
pkgver=15.06.03
pkgrel=1
pkgdesc="A library designed to facilitate the communication between Cura and its backend and similar code."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/Ultimaker/libArcus"
license=('GPL2')
provides=('libarcus')
conflicts=('libarcus-git')
depends=('protobuf3')
makedepends=('git' 'cmake')

source=(
    #"${pkgname}::git+https://github.com/Ultimaker/libArcus.git#commit=${pkgver}"
    "${pkgname}-${pkgver}.tar.gz::https://github.com/Ultimaker/libArcus/archive/${pkgver}.tar.gz"
    )
md5sums=(
    'c61fafaa82f71cef5e0f6780688f853e'
    )

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

#pkgver() {
#    pkgver_git
#}

build4git() {
    cd "${srcdir}/${pkgname}"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=OFF ..
    make
}

build4release() {
    cd "${srcdir}/libArcus-${pkgver}"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=OFF ..
    make
}

build() {
    build4release
}

package4git() {
    cd "${srcdir}/${pkgname}/build"
    make DESTDIR="$pkgdir/" install

    mv "$pkgdir/usr/local/lib64/" "$pkgdir/usr/lib/"
}

package4release() {
    cd "${srcdir}/libArcus-${pkgver}/build"
    make DESTDIR="$pkgdir/" install

    mv "$pkgdir/usr/local/lib64/" "$pkgdir/usr/lib/"
}

package() {
    package4release
}

# vim:set ts=2 sw=2 et:
