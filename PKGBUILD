# Maintainer: taotieren <admin@taotieren.com>

pkgbase=td-system-tools
pkgname=td-system-tools
pkgver=2.7.13
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
    python
    python-netifaces
)
makedepends=(
    gettext
    git
    openssl
    cmake
    ninja
    pkgconf
)
checkdepends=()
optdepends=()
options=('!debug')
source=("${pkgname}::git+${url}.git#tag=${pkgname}-${pkgver}")
sha256sums=('6d89809688a1378c3f3972ac2bcba3bf6f6572bb5635a0314c0cdea55c8061b9')

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
        -Wno-author

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
    install -Dm644 "${srcdir}/${pkgname}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
