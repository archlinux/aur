# Maintainer: Andrew Sun <adsun701 at gmail dot com>

_pkgname="libfilezilla"
pkgname="lib32-${_pkgname}"
pkgver="0.25.0"
pkgrel=1
pkgdesc="Small and modern C++ library, offering some basic functionality to build high-performing, platform-independent programs (32-bit)"
arch=('x86_64')
url="https://lib.filezilla-project.org/"
license=('GPL')
depends=("lib32-gcc-libs" "lib32-clang" "lib32-nettle" "lib32-gnutls" "${_pkgname}")
makedepends=("clang" "gettext")
checkdepends=("lib32-cppunit")
source=("${_pkgname}-${pkgver}.tar.bz2::https://download.filezilla-project.org/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=(
    "$(
        _url="https://download.filezilla-project.org/libfilezilla/libfilezilla-${pkgver}.sha512"
        _sum=$(curl --silent -L "${_url}" | grep "${_pkgname}-${pkgver}.tar.bz2" | awk '{print $1}')
        if [[ ! "${?}" = 0 ]] || [[ ! -v "_sum" ]]; then
            echo -n "SKIP"
        else
            echo -n "${_sum}"
        fi
    )"
)
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export CXX="clang++ -m32"
    export CC="clang -m32"
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --disable-static
    make
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # LANG needed to fix string_test::test_conversion2
    LANG=en_US.UTF-8 make -k check || true
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
