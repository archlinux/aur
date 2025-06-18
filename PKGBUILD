# Maintainer: taotieren <admin@taotieren.com>

pkgbase=td-system-tools
pkgname=td-system-tools
pkgver=2.1.2
pkgrel=1
groups=()
pkgdesc="Tools for Basic System Management"
arch=($CARCH)
url="https://github.com/dreibh/system-tools"
license=('GPL-3.0-only')
provides=(${pkgname} ${pkgname#td-})
conflicts=(${pkgname} ${pkgname#td-})
depends=(
    bash
    glibc
)
makedepends=(
    gettext
    openssl
    cmake
    ninja
    pkgconf
)
checkdepends=(
)
optdepends=()
options=('!debug')
source=("${pkgname#td-}-${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cc78552548c7a957b5b740996a5454342296b5336fea237a7b2bd970d977ad61')

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export LDFLAGS+=" ${LDFLAGS}"

    cd "${srcdir}/${pkgname#td-}-${pkgname}-${pkgver}"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname#td-}-${pkgname}-${pkgver}/build install
    install -Dm644 "${srcdir}/${pkgname#td-}-${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
