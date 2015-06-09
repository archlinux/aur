# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Adam Goldsmith <contact@adamgoldsmith.name>
pkgname=libarcus
pkgver=424ae4f
pkgrel=1
pkgdesc="A library designed to facilitate the communication between Cura and its backend and similar code."
arch=('i686' 'x86_64')
url="https://github.com/Ultimaker/libArcus"
license=('GPL2')
provides=('libarcus')
conflicts=('libarcus-git')
depends=('protobuf3')
makedepends=('git' 'cmake')
source=(
    "${pkgname}::git+https://github.com/Ultimaker/libArcus.git"
    #"${pkgname}-${pkgver}.tar.gz::https://github.com/Ultimaker/CuraEngine/archive/${pkgver}.tar.gz"
    )
md5sums=(
    'SKIP'
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

pkgver() {
    pkgver_git
}

build() {
    cd "${srcdir}/${pkgname}"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=OFF ..
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make DESTDIR="$pkgdir/" install

    mv "$pkgdir/usr/local/lib64/" "$pkgdir/usr/lib/"
}

# vim:set ts=2 sw=2 et:
