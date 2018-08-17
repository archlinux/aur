# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# 10-bit depth currently fails to build
# https://github.com/pkuvcl/xavs2/issues/9

pkgname=xavs2
pkgver=1.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='Open-Source encoder of AVS2-P2/IEEE1857.4 video coding standard'
url='https://github.com/pkuvcl/xavs2/'
license=('GPL')
depends=('glibc' 'liblsmash.so')
makedepends=('gcc7' 'yasm' 'l-smash')
provides=('libxavs2' 'libxavs2.so')
conflicts=('xavs2-git' 'libxavs2' 'libxavs2-git')
replaces=('libxavs2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pkuvcl/${pkgname}/archive/${pkgver}.tar.gz"
        'xavs2-1.0-disable-10bit.patch')
sha256sums=('0e7f682ad20dc783864ff0c483d03b2fbcd70d2fbd098e18c8d06ab6341da71d'
            'e4893da3e1f22e85f8a8f50e58ecaff037d729a3ed64b71794aab6f359c0370c')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    # use gcc7 (it does not build with gcc8)
    sed -i 's/gcc/gcc-7/' build/linux/configure
    
    # disable 10-bit in configure to avoid misleading errors
    patch -Np1 -i "${srcdir}/xavs2-1.0-disable-10bit.patch"
}

build() {
    # must copy the entire source tree for each build or it will not work
    cd "$srcdir"
    cp -af "${pkgname}-${pkgver}" build-8bit
    cp -af "${pkgname}-${pkgver}" build-10bit
    
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
        --libdir='/usr/lib/xavs2-10bit' \
        --includedir='/usr/include/xavs2-10bit' \
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
            mv "${pkgdir}/usr/bin/xavs2" "${pkgdir}/usr/bin/xavs2-${_depth}bit"
        fi
    done
}
