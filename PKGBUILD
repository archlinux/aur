# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# 10-bit depth currently fails to build
# https://github.com/pkuvcl/davs2/issues/4

pkgname=davs2
pkgver=1.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='Open-Source encoder of AVS2-P2/IEEE1857.4 video coding standard'
url='https://github.com/pkuvcl/davs2/'
license=('GPL')
depends=('glibc' 'liblsmash.so')
makedepends=('gcc7' 'yasm' 'l-smash')
provides=('libdavs2' 'libdavs2.so')
conflicts=('davs2-git' 'libdavs2' 'libdavs2-git')
replaces=('libdavs2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pkuvcl/${pkgname}/archive/${pkgver}.tar.gz"
        'davs2-1.0-add-linux-support.patch'
        'davs2-1.0-disable-10bit.patch')
sha256sums=('1b8bd800f7c4d63e904a4355de0144c55d427d3f1477064b53de1c3e028d9eaa'
            '66166908defadbac7bbaab44a2eaab09af9f6b9ad37c035772e32a6a09c0b605'
            'd9ff66752e6a30cbd94526f77074bfe826628cf3a285b19443cc53a803316c2f')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    # add linux support
    sed -i $'s/\r$//' source/common/vec/intrinsic_sao_avx2.cc
    patch -Np1 -i "${srcdir}/davs2-1.0-add-linux-support.patch"
    
    # disable 10-bit in configure to avoid misleading errors
    patch -Np1 -i "${srcdir}/davs2-1.0-disable-10bit.patch"
    
    # use gcc7 (it does not build with gcc8)
    sed -i 's/g++/g++-7/' build/linux/configure
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
