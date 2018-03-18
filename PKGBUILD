# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=megaglest-data-git
pkgver=3.13.0.r4.gd1444655
pkgrel=1
pkgdesc='Fork of Glest, a 3D real-time strategy game in a fantastic world (data files, git version)'
arch=('any')
url='https://megaglest.org/'
license=('custom:CC-BY-SA-3.0')
makedepends=('git' 'cmake' 'xz')
provides=('megaglest-data')
conflicts=('megaglest-data')
source=("$pkgname"::'git+https://github.com/MegaGlest/megaglest-data.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    
    rm -rf build
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DWANT_INSTALL_DATA:BOOL='ON' \
        -Wno-dev \
        ..
}

package() {
    cd "${pkgname}/build"
    
    make DESTDIR="$pkgdir" install
    
    # license
    cd "${srcdir}/${pkgname}/docs"
    install -D -m644 README.data-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
