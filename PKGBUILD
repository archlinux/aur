# Maintainer: Yunhui Fu <yhfudev@gmail.com>

pkgname=google-glog-git
pkgver=r212.0472b91
pkgrel=2
pkgdesc="Logging library for C++, compiled with cmake"
arch=('i686' 'x86_64')
license=('custom:BSD3')
url='https://github.com/google/glog'
depends=('gcc-libs')
makedepends=('make' 'gcc' 'git')
conflicts=('google-glog')
provides=('google-glog')
source=(
    #"glog-$pkgver::https://github.com/google/glog/archive/v$pkgver.tar.gz"
    "${pkgname}::git+https://github.com/google/glog.git"
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
    # Lazy way of dealing with conflicting man and info pages...
    rm -rf "${pkgdir}/usr/share"

    install -Dm644 ${srcdir}/${pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

md5sums=(
    'SKIP'
    )
