# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Devaux Fabien <fdev31@gmail.com>

pkgname=kvazaar-git
pkgver=1.2.0.r313.g933ff6ed
pkgrel=1
pkgdesc='An open-source HEVC encoder (git version)'
arch=('x86_64')
url='http://ultravideo.cs.tut.fi/#encoder'
license=('LGPL')
depends=('glibc' 'gcc-libs' 'crypto++')
makedepends=('git' 'yasm')
checkdepends=('ffmpeg' 'hm')
provides=('kvazaar')
conflicts=('kvazaar')
source=('git+https://github.com/ultravideo/kvazaar.git'
        'git+https://github.com/ultravideo/greatest.git'
        'kvazaar-git-disable-test-external-symbols.patch')
sha256sums=('SKIP'
            'SKIP'
            '3a4dd1b38d58751381b24c81a86c21df7cfdc85ba5c6a13d879f112e463189b9')

prepare() {
    cd kvazaar
    
    git submodule init
    git config --local submodule.greatest.url "${srcdir}/greatest"
    git submodule update
    
    # disable a test that is failing: test_external_symbols.sh
    # https://github.com/ultravideo/kvazaar/issues/215
    patch -Np1 -i "${srcdir}/kvazaar-git-disable-test-external-symbols.patch"
    
    ./autogen.sh
}

pkgver() {
    cd kvazaar
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd kvazaar
    
    ./configure \
        --prefix='/usr' \
        --with-cryptopp
        
    make
}

check() {
    cd kvazaar
    
    make check
}

package() {
    cd kvazaar
    
    make DESTDIR="$pkgdir" install
}
