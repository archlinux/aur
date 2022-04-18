# Maintainer: redtide <redtid3@gmail.com>

_pkgname="sddm-conf"
pkgname="${_pkgname}-git"
pkgver=r3.41a690a
pkgrel=1
pkgdesc="SDDM Configuration Editor"
arch=("i686" "x86_64")
url="https://github.com/redtide/sddm-conf"
license=("MIT")
depends=("polkit" "sddm")
makedepends=("cmake" "git" "qt5-tools")
source=("${_pkgname}::git+https://github.com/redtide/sddm-conf.git")
sha512sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
build() {
    cd "${srcdir}/${_pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE="None" \
        -Wno-dev \
        -B build \
        -S .
    make VERBOSE=1 -C build
}
package() {
    cd "${srcdir}/${_pkgname}"
    make VERBOSE=1 DESTDIR="${pkgdir}" install -C build
    install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
