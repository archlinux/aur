# Maintainer: taotieren <admin@taotieren.com>

pkgbase=libosal
pkgname=libosal
_tagname=0.1.1-rev0
pkgver="${_tagname//-/_}"
pkgrel=2
pkgdesc="libosal is an operating system abstraction layer Library. It's purpose is to write os-independent code for easy portability between different systems and architectures."
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
sha256sums=('0611a1e28b044c3766033c7f21274c1415df2a1f900af50ce21a94e9a7aa499d')
options=()

build() {
    cd "${srcdir}/${pkgname}/"
    echo "VERSION = ${_tagname}" >project.properties
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
}

check() {
    cd "${srcdir}/${pkgname}"
    #     make check
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}"/${pkgname}/build
    #     cd "${srcdir}/${pkgname}-${pkgver}"
    #     make DESTDIR=${pkgdir} install
}
