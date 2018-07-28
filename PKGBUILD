# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# - 10-bit depth currently fails to build
# - 10-bit sections are commented out until it works

pkgbase=xavs2
pkgname=('xavs2' 'libxavs2') #'libxavs2-10bit' 'libxavs2-all')
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/pkuvcl/xavs2/'
license=('GPL')
depends=('glibc')
makedepends=('gcc7' 'yasm' 'l-smash')
source=("${pkgbase}-${pkgver}.tar.gz"::"https://github.com/pkuvcl/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0e7f682ad20dc783864ff0c483d03b2fbcd70d2fbd098e18c8d06ab6341da71d')

prepare() {
    cd "${pkgbase}-${pkgver}"
    
    # use gcc7 (it does not build with gcc8)
    sed -i 's/gcc/gcc-7/' build/linux/configure
    
    # must copy the entire source tree for each build or it will not work
    cd "$srcdir"
    cp -af "${pkgbase}-${pkgver}" build-8bit
    #cp -af "${pkgbase}-${pkgver}" build-10bit
}

build() {
    for _depth in 8 #10
    do
        msg2 "Building for ${_depth}-bit..."
        
        cd "build-${_depth}bit/build/linux"
        
        ./configure \
            --prefix='/usr' \
            --enable-shared \
            --bit-depth="$_depth" \
            --chroma-format='all' \
            --enable-lto \
            --enable-pic \
            --disable-swscale \
            --disable-lavf \
            --disable-ffms \
            --disable-gpac
            
        make
        
        cd "$srcdir"
    done
}

package_xavs2() {
    pkgdesc='CLI tool for the open-source encoder of AVS2-P2/IEEE1857.4 video coding standard'
    depends+=('l-smash')
    
    for _depth in 8 #10
    do
        provides+=("xavs2-${_depth}bit" "xavs2-${_depth}bit")
        conflicts+=("xavs2-${_depth}bit-git")
        
        msg2 "Installing CLI for ${_depth}-bit..."
        
        make -C "build-${_depth}bit/build/linux" DESTDIR="$pkgdir" install-cli
        
        mv "$pkgdir"/usr/bin/xavs2 "$pkgdir"/usr/bin/xavs2-${_depth}bit
    done
    
    ln -sf xavs2-8bit "${pkgdir}"/usr/bin/xavs2
}

package_libxavs2() {
    pkgdesc='Library for the open-source encoder of AVS2-P2/IEEE1857.4 video coding standard (8bit depth)'
    provides=('libxavs2-8bit' 'libxavs2' 'libxavs2.so')
    conflicts=('libxavs2-8bit-git' 'libxavs2-10bit' 'libxavs2-10bit-git')
    
    make -C build-8bit/build/linux DESTDIR="$pkgdir" install-lib-shared
}

# bash block-comment
:<<'10-bit-pkgs'
package_libxavs2-10bit() {
    pkgdesc='Library for the open-source encoder of AVS2-P2/IEEE1857.4 video coding standard (10bit depth)'
    provides=('libxavs2' 'libxavs2.so')
    conflicts=('libxavs2-10bit-git' 'libxavs2-8bit' 'libxavs2-8bit-git' 'libxavs2-git')
    
    make -C build-8bit/build/linux DESTDIR="$pkgdir" install-lib-shared
}

package_libxavs2-all() {
    pkgdesc="Library for the open-source encoder of AVS2-P2/IEEE1857.4 video coding standard (all depths)"
    
    local _ver="$(grep '^#define[[:space:]]XAVS2_BUILD' "${pkgbase}-${pkgver}/source/xavs2.h" | awk -F' ' '{ print $3 }' | sed 's/[^[:alnum:]]$//')"
    
    install -d "${pkgdir}/usr/lib/xavs2"
    
    for _depth in 8 10
    do
        provides+=("libxavs2-${_depth}bit.so")
    
        make -C build-${_depth}bit/build/linux DESTDIR="$pkgdir" install-lib-shared
    
        mv "${pkgdir}"/usr/lib/libxavs2.so.${_ver} "${pkgdir}"/usr/lib/xavs2/libxavs2-${_depth}bit.so.${_ver}
        
        rm -r "${pkgdir}"/usr/{include,lib/libxavs2.so,lib/pkgconfig}
    
        ln -sfr "${pkgdir}"/usr/lib/xavs2/libxavs2-${_depth}bit.so{.${_ver},}
    done
}
10-bit-pkgs
