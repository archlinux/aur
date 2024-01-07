# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=openjph-git
pkgname=('openjph-git' 'openjph-doc-git')
pkgver=0.10.1.r0.ge7cf53e
pkgrel=1
pkgdesc='Open-source implementation of JPEG2000 Part-15 (git version)'
arch=('x86_64')
url='https://github.com/aous72/OpenJPH/'
license=('BSD')
makedepends=('git' 'cmake' 'doxygen' 'libtiff')
source=('git+https://github.com/aous72/OpenJPH.git')
sha256sums=('SKIP')

pkgver() {
    git -C OpenJPH describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S OpenJPH \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DOJPH_ENABLE_INTEL_AVX512:BOOL='OFF' \
        -DOJPH_BUILD_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
    
    cd OpenJPH/docs
    doxygen
}

check() {
    ctest --test-dir build --output-on-failure
}

package_openjph-git() {
    depends=('libtiff')
    provides=('openjph')
    conflicts=('openjph')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 OpenJPH/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_openjph-doc-git() {
    pkgdesc="$(sed 's/(\(git\)/(documentation; \1/' <<< "$pkgdesc")"
    arch=('any')
    provides=('openjph-doc')
    conflicts=('openjph-doc')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    install -D -m644 OpenJPH/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -dr --no-preserve='ownership' OpenJPH/docs/html "${pkgdir}/usr/share/doc/openjph"
}
