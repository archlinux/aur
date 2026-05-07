# Maintainer: taotieren <admin@taotieren.com>

pkgbase=td-system-tools
pkgname=td-system-tools
pkgver=2.5.5
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
    git
    openssl
    cmake
    ninja
    pkgconf
)
checkdepends=(
)
optdepends=()
options=('!debug')
source=("${pkgname}::git+${url}.git#tag=${pkgname}-${pkgver}")
sha256sums=('d7c0dd4ecd06fb07dd7a73557528c694081f8348c51e814627bdb74b39204e22')

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export LDFLAGS+=" ${LDFLAGS}"

    cd "${srcdir}/${pkgname}"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm644 "${srcdir}/${pkgname}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
