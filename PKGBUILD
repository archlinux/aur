# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=gmmlib-git
pkgver=r7.0154744
pkgrel=1
pkgdesc='Intel Graphics Memory Management Library (git version)'
arch=('i686' 'x86_64')
url='https://github.com/intel/gmmlib/'
license=('MIT')
makedepends=('git' 'cmake')
provides=('gmmlib')
conflicts=('gmmlib')
source=("$pkgname"::'git+https://github.com/intel/gmmlib.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    
    mkdir -p build
    cd build
    
    if [ "$CARCH" = 'x64_64' ] 
    then
        _arch='64'
        
    elif [ "$CARCH" = 'i686' ] 
    then
        _arch='32'
    fi
    
    cmake \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DARCH="$_arch" \
        -Wno-dev \
        ..
    
    make
}

package() {
    cd "${pkgname}/Source/inc"
    
    # includes
    mkdir -p "${pkgdir}/usr/include/"{common,umKmInc}
    install -m644 *.h "${pkgdir}/usr/include"
    cd "${srcdir}/${pkgname}/Source/inc/common"
    install -m644 *.h "${pkgdir}/usr/include/common"
    cd "${srcdir}/${pkgname}/Source/inc/umKmInc"
    install -m644 *.h "${pkgdir}/usr/include/umKmInc"
    
    # libraries
    mkdir -p "${pkgdir}/usr/lib"
    cd "${srcdir}/${pkgname}/build/Source/GmmLib/"
    install -m644 *.a "${pkgdir}/usr/lib"
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
