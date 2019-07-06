# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=kvazaar
pkgver=1.2.0
pkgrel=8
pkgdesc='An open-source HEVC encoder'
arch=('x86_64')
url='http://ultravideo.cs.tut.fi/#encoder'
license=('LGPL')
depends=('glibc' 'gcc-libs' 'crypto++')
makedepends=('git' 'yasm')
checkdepends=('ffmpeg' 'hm')
BUILDENV+=('!check')
source=("git+https://github.com/ultravideo/kvazaar.git#tag=v${pkgver}"
        'git+https://github.com/ultravideo/greatest.git'
        'kvazaar-crypto++6.0.0.patch')
sha256sums=('SKIP'
            'SKIP'
            '02396099561b9c87462420ee6b16706237c7502938c1b3ab9fc3797ea2ec568a')

prepare() {
    cd kvazaar
    
    git submodule init
    git config --local submodule.greatest.url "${srcdir}/greatest"
    git submodule update
    
    patch -Np1 -i "${srcdir}/kvazaar-crypto++6.0.0.patch"
    
    ./autogen.sh
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
