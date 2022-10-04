# Contributor: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
pkgname=mcnptools
pkgver=5.3.1
pkgrel=1
tag=v${pkgver}
pkgdesc="Several utility programs to perform common tasks when interacting with the MCNP® code"
url="https://github.com/lanl/mcnptools"
license=('BSD-3')
arch=('x86_64')
makedepends=('git' 'cmake')
depends=('hdf5' 'python')
source=($pkgname::git+https://github.com/lanl/mcnptools.git)
sha256sums=('SKIP')

prepare(){
    cd ${srcdir}/${pkgname}
    msg "Verify whether we are already at the wanted tag"
    if git rev-parse "${pkgname}-${tag}" >/dev/null 2>&1; then
        msg " => tag exists";
        msg "git checkout ${pkgname}-${tag}"
        git checkout ${pkgname}-${tag}
    else
        msg " => tag does not exist"
        msg "git checkout main"
        git checkout main
        msg "git fetch origin"
        git fetch origin
        msg "git checkout ${tag}"
        git checkout ${tag}
    fi
}

build() {
    rm -rf ${srcdir}/build
    mkdir ${srcdir}/build
    cd ${srcdir}/build
    cmake -D CMAKE_INSTALL_PREFIX=/usr \
          -D mcnptools.python_install=User \
          ../${pkgname}
    cmake --build . --config Release
}

check(){
    cd ${srcdir}/build
    ctest --build-config Release
}

package() {
    cd ${srcdir}/build
    DESTDIR="$pkgdir" cmake --install . --config Release
}
