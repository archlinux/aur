# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Devaux Fabien <fdev31@gmail.com>

pkgname=srt-git
_srcname=srt
pkgver=1.3.2.r58.g11feba2
pkgrel=1
pkgdesc='Secure Reliable Transport - transport technology that optimizes streaming performance across unpredictable networks (git version)'
arch=('x86_64')
url='https://www.srtalliance.org/'
license=('MPL2')
depends=('openssl')
makedepends=('git' 'cmake')
provides=('srt')
conflicts=('srt')
source=('git+https://github.com/Haivision/srt.git'
        'srt-git-remove-insecure-rpath.patch')
sha256sums=('SKIP'
            'b96008ed593f893b1051191483f9aea0f58703bc6d5074537a6ea740120c0bf6')

prepare() {
    cd "$_srcname"
    
    mkdir -p build
    
    # remove insecure rpath
    patch -Np1 -i "${srcdir}/srt-git-remove-insecure-rpath.patch"
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${_srcname}/build"
    
    cmake \
        -DCMAKE_INSTALL_BINDIR:PATH='bin' \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_TESTING='True' \
        -Wno-dev \
        ..
        
    make
}

check() {
    cd "${_srcname}/build"
    
    ./utility-test
}

package() {
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
    
    rm "$pkgdir"/usr/bin/*-test
}
