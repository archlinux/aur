# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# - 10-bit depth currently fails to build
# - 10-bit sections are commented out until it works

pkgbase=davs2-git
pkgname=('davs2-git' 'libdavs2-git') #'libdavs2-10bit-git' 'libdavs2-all-git')
pkgver=1.0.r116.gc29c026
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/pkuvcl/davs2/'
license=('GPL')
depends=('glibc')
makedepends=('git' 'gcc7' 'yasm' 'l-smash')
source=("$pkgbase"::'git+https://github.com/pkuvcl/davs2.git')
sha256sums=('SKIP')

prepare() {
    cd "$pkgbase"
    
    # use gcc7 (it does not build with gcc8)
    sed -i 's/g++/g++-7/' build/linux/configure
    
    # must copy the entire source tree for each build or it will not work
    cd "$srcdir"
    cp -af "$pkgbase" build-8bit
    #cp -af "$pkgbase" build-10bit
}

pkgver() {
    cd "$pkgbase"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
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

package_davs2-git() {
    pkgdesc='CLI tool for the open-source decoder of AVS2-P2/IEEE1857.4 video coding standard (git version)'
    depends+=('l-smash')
    
    for _depth in 8 #10
    do
        provides+=("davs2-${_depth}bit-git" "davs2-${_depth}bit")
        conflicts+=("davs2-${_depth}bit")
        
        msg2 "Installing CLI for ${_depth}-bit..."
        
        make -C "build-${_depth}bit/build/linux" DESTDIR="$pkgdir" install-cli
        
        mv "$pkgdir"/usr/bin/davs2 "$pkgdir"/usr/bin/davs2-${_depth}bit
    done
    
    ln -sf davs2-8bit "${pkgdir}"/usr/bin/davs2
}

package_libdavs2-git() {
    pkgdesc='Library for the open-source decoder of AVS2-P2/IEEE1857.4 video coding standard (8bit depth) (git version)'
    provides=('libdavs2-8bit-git' 'libdavs2-8bit' 'libdavs2' 'libdavs2.so')
    conflicts=('libdavs2-8bit' 'libdavs2-10bit' 'libdavs2-10bit-git')
    
    make -C build-8bit/build/linux DESTDIR="$pkgdir" install-lib-shared
}

# bash block-comment
:<<'10-bit-pkgs'
package_libdavs2-10bit-git() {
    pkgdesc='Library for the open-source decoder of AVS2-P2/IEEE1857.4 video coding standard (10bit depth) (git version)'
    provides=('libdavs2-10bit' 'libdavs2' 'libdavs2-git' 'libdavs2.so')
    conflicts=('libdavs2-10bit' 'libdavs2-8bit' 'libdavs2-8bit-git' 'libdavs2-git')
    
    make -C build-8bit/build/linux DESTDIR="$pkgdir" install-lib-shared
}

package_libdavs2-all-git() {
    pkgdesc="Library for the open-source decoder of AVS2-P2/IEEE1857.4 video coding standard (all depths) (git version)"
    
    local _ver="$(grep '^api=[0-9]*$' "${pkgbase}/version.sh" | awk -F'=' '{ print $2 }')"
    
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
