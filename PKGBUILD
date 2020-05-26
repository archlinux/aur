# Maintainer: Zezadas <aur at sefod dot eu>
# Forked from: https://aur.archlinux.org/packages/rexgen-git/

pkgname=rexgen-git-gcc10
pkgver=2.1.3.r2.g585e86d
pkgrel=1
pkgdesc="A tool to create words based on regular expressions"
arch=('i686' 'x86_64')
url="https://github.com/teeshop/rexgen"
license=('GPL')
depends=('git')
makedepends=('gcc' 'cmake' 'flex' 'bison')
provides=('rexgen-git')
source=("${pkgname}::git+https://github.com/teeshop/rexgen.git"
        'gcc10-fix.patch')
sha256sums=('SKIP'
            '1ab2daa96d91bd101c416a06ef4f4b878557571c762634bf7ca6d16be18433a7')

prepare(){
        cd ${pkgname}
        patch -p1 -i ${srcdir}/gcc10-fix.patch
}

pkgver() {
        cd "${pkgname}"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        mkdir -p "${pkgname}/src/build"
        cd "${pkgname}/src/build"

        #cmake -Wno-dev .. \
        #       -DCMAKE_INSTALL_PREFIX=/usr \
        #       -DOPENSSL_INCLUDE_DIR="/usr/include/openssl-1.0"

        cmake -Wno-dev .. \
                -DCMAKE_INSTALL_PREFIX=/usr

        make ${MAKEFLAGS} all
}

package() {
        cd "${pkgname}/src/build"

        make DESTDIR="${pkgdir}" install
}
