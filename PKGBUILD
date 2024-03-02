# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=intel-metee-git
pkgname=('intel-metee-git' 'intel-metee-doc-git')
pkgver=4.0.0.r0.g32f1c55
pkgrel=1
pkgdesc='Access library for Intel CSME HECI interface (git version)'
arch=('x86_64')
url='https://github.com/intel/metee/'
license=('Apache-2.0')
makedepends=('git' 'cmake' 'doxygen' 'graphviz')
source=('git+https://github.com/intel/metee.git')
sha256sums=('SKIP')

pkgver() {
    git -C metee describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S metee \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DBUILD_DOCS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package_intel-metee-git() {
    depends=('glibc')
    provides=('intel-metee')
    conflicts=('intel-metee')
    
    DESTDIR="${pkgdir}" cmake --install build
    mv "${pkgdir}/usr/share/doc" .
}

package_intel-metee-doc-git() {
    pkgdesc="$(sed 's/(\(git\)/(documentation; \1/' <<< "$pkgdesc")"
    arch=('any')
    provides=('intel-metee-doc')
    conflicts=('intel-metee-doc')
    
    install -d -m755 "${pkgdir}/usr/share"
    mv doc "${pkgdir}/usr/share"
}
