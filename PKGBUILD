# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# - 10-bit depth currently fails to build
# - 10-bit sections are commented out until it works

pkgbase=davs2
pkgname=('davs2' 'libdavs2') #'libdavs2-10bit' 'libdavs2-all')
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/pkuvcl/davs2/'
license=('GPL')
depends=('glibc')
makedepends=('gcc7' 'yasm' 'l-smash')
source=("${pkgbase}-${pkgver}.tar.gz"::"https://github.com/pkuvcl/${pkgname}/archive/${pkgver}.tar.gz"
        'davs2-1.0-add-linux-support.patch')
sha256sums=('1b8bd800f7c4d63e904a4355de0144c55d427d3f1477064b53de1c3e028d9eaa'
            '66166908defadbac7bbaab44a2eaab09af9f6b9ad37c035772e32a6a09c0b605')

prepare() {
    cd "${pkgbase}-${pkgver}"
    
    # add linux support
    sed -i $'s/\r$//' source/common/vec/intrinsic_sao_avx2.cc
    patch -Np1 -i "${srcdir}/davs2-1.0-add-linux-support.patch"
    
    # use gcc7 (it does not build with gcc8)
    sed -i 's/g++/g++-7/' build/linux/configure
    
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

package_davs2() {
    pkgdesc='CLI tool for the open-source decoder of AVS2-P2/IEEE1857.4 video coding standard'
    depends+=('l-smash')
    
    for _depth in 8 #10
    do
        provides+=("davs2-${_depth}bit" "davs2-${_depth}bit")
        conflicts+=("davs2-${_depth}bit-git")
        
        msg2 "Installing CLI for ${_depth}-bit..."
        
        make -C "build-${_depth}bit/build/linux" DESTDIR="$pkgdir" install-cli
        
        mv "$pkgdir"/usr/bin/davs2 "$pkgdir"/usr/bin/davs2-${_depth}bit
    done
    
    ln -sf davs2-8bit "${pkgdir}"/usr/bin/davs2
}

package_libdavs2() {
    pkgdesc='Library for the open-source decoder of AVS2-P2/IEEE1857.4 video coding standard (8bit depth)'
    provides=('libdavs2-8bit' 'libdavs2' 'libdavs2.so')
    conflicts=('libdavs2-8bit-git' 'libdavs2-10bit' 'libdavs2-10bit-git')
    
    make -C build-8bit/build/linux DESTDIR="$pkgdir" install-lib-shared
}

# bash block-comment
:<<'10-bit-pkgs'
package_libdavs2-10bit() {
    pkgdesc='Library for the open-source decoder of AVS2-P2/IEEE1857.4 video coding standard (10bit depth)'
    provides=('libdavs2' 'libdavs2.so')
    conflicts=('libdavs2-10bit-git' 'libdavs2-8bit' 'libdavs2-8bit-git' 'libdavs2-git')
    
    make -C build-8bit/build/linux DESTDIR="$pkgdir" install-lib-shared
}

package_libdavs2-all() {
    pkgdesc="Library for the open-source decoder of AVS2-P2/IEEE1857.4 video coding standard (all depths)"
    
    local _ver="$(grep '^api=[0-9]*$' "${pkgbase}-${pkgver}/version.sh" | awk -F'=' '{ print $2 }')"
    
    install -d "${pkgdir}/usr/lib/davs2"
    
    for _depth in 8 10
    do
        provides+=("libdavs2-${_depth}bit.so")
    
        make -C build-${_depth}bit/build/linux DESTDIR="$pkgdir" install-lib-shared
    
        mv "${pkgdir}"/usr/lib/libdavs2.so.${_ver} "${pkgdir}"/usr/lib/davs2/libdavs2-${_depth}bit.so.${_ver}
        
        rm -r "${pkgdir}"/usr/{include,lib/libdavs2.so,lib/pkgconfig}
    
        ln -sfr "${pkgdir}"/usr/lib/davs2/libdavs2-${_depth}bit.so{.${_ver},}
    done
}
10-bit-pkgs
