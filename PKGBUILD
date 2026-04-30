# Maintainer: taotieren <admin@taotieren.com>

pkgbase=td-system-tools
pkgname=td-system-tools
pkgver=2.4.3
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
sha256sums=('fdb0f2a62f2489b265e3e41b7cec5642a9a1a1192ab33e8dbe649ef175db2507')

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
