# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# 10-bit depth currently fails to build
# https://github.com/pkuvcl/davs2/issues/4

pkgname=davs2-git
pkgver=1.0.r124.gb81c17c
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Open-Source decoder of AVS2-P2/IEEE1857.4 video coding standard (git version)'
url='https://github.com/pkuvcl/davs2/'
license=('GPL')
depends=('glibc' 'liblsmash.so')
makedepends=('git' 'gcc7' 'yasm' 'l-smash')
provides=('davs2' 'libdavs2' 'libdavs2-git' 'libdavs2.so')
conflicts=('davs2' 'libdavs2' 'libdavs2-git')
replaces=('libdavs2-git')
source=("$pkgname"::'git+https://github.com/pkuvcl/davs2.git')
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    
    # use gcc7 (it does not build with gcc8)
    sed -i 's/g++/g++-7/' build/linux/configure
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    # must copy the entire source tree for each build or it will not work
    cd "$srcdir"
    cp -af "$pkgname" build-8bit
    cp -af "$pkgname" build-10bit
    
    msg2 'Building for 8-bit...'
    cd build-8bit/build/linux
    ./configure \
        --prefix='/usr' \
        --enable-shared \
        --bit-depth='8' \
        --chroma-format='all' \
        --enable-lto \
        --enable-pic \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac
    make
    
    msg2 'Building for 10-bit...'
    cd "${srcdir}/build-10bit/build/linux"
    if ./configure \
        --prefix='/usr' \
        --libdir='/usr/lib/davs2-10bit' \
        --includedir='/usr/include/davs2-10bit' \
        --enable-shared \
        --bit-depth='10' \
        --chroma-format='all' \
        --enable-lto \
        --enable-pic \
        --disable-swscale \
        --disable-lavf \
        --disable-ffms \
        --disable-gpac
    then
        make
    else
        cd "$srcdir"
        rm -rf build-10bit
    fi
}

package() {
    local _depth
    
    for _depth in 10 8
    do
        msg2 "Installing for ${_depth}-bit..."
        
        if [ "$_depth" -eq '10' ] && ! [ -d 'build-10bit' ] 
        then
            printf '%s\n' 'BitDepth 10 not supported currently.'
            continue
        fi
        
        make -C "build-${_depth}bit/build/linux" DESTDIR="$pkgdir" install-cli install-lib-shared
        
        if [ "$_depth" -eq '10' ] 
        then
            mv "${pkgdir}/usr/bin/davs2" "${pkgdir}/usr/bin/davs2-${_depth}bit"
        fi
    done
}
