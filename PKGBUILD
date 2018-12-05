# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=megaglest-data-git
_srcname=megaglest-data
pkgver=3.13.0.r6.gbc110bb2
pkgrel=1
pkgdesc='Fork of Glest, a 3D real-time strategy game in a fantastic world (data files, git version)'
arch=('any')
url='https://megaglest.org/'
license=('CCPL')
makedepends=('git' 'cmake' 'xz')
provides=('megaglest-data')
conflicts=('megaglest-data')
source=('git+https://github.com/MegaGlest/megaglest-data.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    rm -rf build
    mkdir -p build
    cd build
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DWANT_INSTALL_DATA:BOOL='ON' \
        -Wno-dev \
        ..
}

package() {
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
    
    # license
    cd "${srcdir}/${_srcname}/docs"
    install -D -m644 README.data-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/NOTES"
}
