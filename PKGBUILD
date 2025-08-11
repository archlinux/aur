# Maintainer: taotieren <admin@taotieren.com>

pkgbase=libosal
pkgname=libosal
_tagname=0.2.1
pkgver="${_tagname//-/_}"
pkgrel=1
pkgdesc="Write os-independent code for easy portability between different systems and architectures"
arch=($CARCH)
url="https://github.com/robert-burger/libosal"
license=('LGPL-3.0-only')
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(glibc)
makedepends=(
    cmake
    git
    pkgconf
)
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git#tag=${_tagname}")
sha256sums=('e1db7e29d34bb88177b30f81d7f4a079ae0c33f3ea130de9482c1d324bb1858d')
options=()

build() {
    cd "${srcdir}/${pkgname}/"
    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    # gcc build
    #     cmake -DCMAKE_BUILD_TYPE=Release \
    cmake -DCMAKE_BUILD_TYPE=None \
        -DBUILD_FOR_PLATFORM="POSIX" \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -B build \
        -Wno-dev

    cmake --build build
    # sed "s|PACKAGE_VERSION|${_tagname}|" configure.ac.in > configure.ac
    # autoreconf -is
    # ./configure --prefix=/usr
    # make
}

check() {
    cd "${srcdir}/${pkgname}"
    ctest --test-dir build --output-on-failure
    #  make check CFLAGS="-Wall -Wextra"
    # make check CFLAGS="-Wall -Wextra -Werror -m64  -Wall -Wshadow \
    # -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}"/${pkgname}/build
    #     cd "${srcdir}/${pkgname}-${pkgver}"
    #     make DESTDIR=${pkgdir} install
}
