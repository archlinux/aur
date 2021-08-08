# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=intel-metee-git
pkgname=('intel-metee-git' 'intel-metee-doc-git')
pkgver=3.1.0.r0.g73636d2
pkgrel=2
pkgdesc='Access library for Intel CSME HECI interface (git version)'
arch=('x86_64')
url='https://github.com/intel/metee/'
license=('Apache')
makedepends=('git' 'cmake' 'doxygen')
provides=('intel-metee')
conflicts=('intel-metee')
source=('git+https://github.com/intel/metee.git')
sha256sums=('SKIP')

pkgver() {
    git -C metee describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S metee \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -Wno-dev
    make -C build
}

package_intel-metee-git() {
    depends=('glibc')
    
    make -C build DESTDIR="$pkgdir" install
    mv "${pkgdir}/usr/share/doc" .
}

package_intel-metee-doc-git() {
    pkgdesc+=' (documentation) (git version)'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share"
    mv doc "${pkgdir}/usr/share"
}
