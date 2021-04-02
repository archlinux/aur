# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=megaglest-data-git
pkgver=3.13.0.r10.gc48f8ebd
pkgrel=1
pkgdesc='Fork of Glest, a 3D real-time strategy game in a fantastic world (data files, git version)'
arch=('any')
url='https://megaglest.org/'
license=('custom:CCBYSA3.0')
makedepends=('git' 'cmake' 'xz')
provides=('megaglest-data')
conflicts=('megaglest-data')
source=('git+https://github.com/MegaGlest/megaglest-data.git')
sha256sums=('SKIP')

pkgver() {
    git -C megaglest-data describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S megaglest-data \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DWANT_INSTALL_DATA:BOOL='ON' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 megaglest-data/docs/README.data-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/NOTES"
}
