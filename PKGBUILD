# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Devaux Fabien <fdev31@gmail.com>

pkgname=kvazaar-git
pkgver=1.2.0.r59.g01642916
pkgrel=1
pkgdesc='An open-source HEVC encoder licensed under LGPLv2.1 (git version)'
arch=('i686' 'x86_64')
url='http://ultravideo.cs.tut.fi/#encoder'
license=('LGPL2.1')
depends=('glibc' 'gcc-libs' 'crypto++')
makedepends=('git' 'yasm')
provides=('kvazaar' 'libkvazaar.so')
conflicts=('kvazaar')
source=("$pkgname"::'git+https://github.com/ultravideo/kvazaar.git'
        'kvazaar-submodule-greatest'::'git+https://github.com/ultravideo/greatest.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "$pkgname"
    
    git submodule init
    git config --local submodule.greatest.url "${srcdir}/kvazaar-submodule-greatest"
    git submodule update
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    
    ./autogen.sh
    
    ./configure \
        --prefix='/usr' \
        --enable-largefile \
        --enable-static='no' \
        --enable-shared='yes' \
        --enable-fast-install='yes' \
        --with-cryptopp
        
    make
}

package() {
    cd "$pkgname"
    
    make DESTDIR="$pkgdir" install
}
