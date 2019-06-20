# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Devaux Fabien <fdev31@gmail.com>

pkgname=kvazaar-git
pkgver=1.2.0.r318.g75b25955
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
        'git+https://github.com/ultravideo/greatest.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd kvazaar
    
    git submodule init
    git config --local submodule.greatest.url "${srcdir}/greatest"
    git submodule update
    
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
