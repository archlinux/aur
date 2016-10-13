# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=libisam
pkgver=r13.df3154d
pkgrel=1
pkgdesc="iSAM is an optimization library for sparse nonlinear problems as encountered in simultaneous localization and mapping (SLAM)"
arch=('i686' 'x86_64')
license=('LGPL')
url='http://people.csail.mit.edu/kaess/isam/'
depends=('eigen' 'suitesparse')
makedepends=('cmake' 'make' 'gcc' 'git')
optdepends=('sdl')
conflicts=('libisam-git')
provides=('libisam')
source=(
    #"{pkgname}-${pkgver}.tar.gz::http://people.csail.mit.edu/kaess/isam/isam_v1_7.tgz"
    "${pkgname}::git+https://github.com/ipab-slmc/isam.git"
    )

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    #local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    #echo ${ver:0:7}
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

pkgver() {
    pkgver_git
}

build4git() {
    cd "${srcdir}/${pkgname}"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_EXAMPLES=OFF -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF ..
    make
}

build() {
    build4git
}

package4git() {
    cd "${srcdir}/${pkgname}/build"
    make DESTDIR="$pkgdir/" install
    mv "$pkgdir/usr/local/lib/" "$pkgdir/usr/lib/"
}

package() {
    package4git
}

md5sums=(
    'SKIP'
    )
