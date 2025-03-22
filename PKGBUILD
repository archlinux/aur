# Maintainer: 2-4601 <AUR@othermemory.org>

_pkg_base_name=qpdf
_pkg_base_major_ver=11
_pkg_base_minor_ver=10
_pkg_base_patch_ver=1
_pkg_lib_name=lib"${_pkg_base_name}"
_pkg_lib_major_ver=29
_pkg_lib_minor_ver=10
_pkg_lib_patch_ver=1

pkgname="${_pkg_lib_name}${_pkg_lib_major_ver}"
pkgver="${_pkg_base_major_ver}.${_pkg_base_minor_ver}.${_pkg_base_patch_ver}"
pkgrel=1
pkgdesc="Legacy version (${_pkg_lib_major_ver}) of QPDF library. Only library, no tools."
arch=("x86_64")
url="https://github.com/qpdf/qpdf"
license=("Apache-2.0" "Artistic-2.0")
depends=(
    "gnutls"
    "libjpeg-turbo"
    "openssl"
    "zlib"
)
makedepends=(
    "cmake"
)
provides=(
    "${_pkg_lib_name}.so.${_pkg_lib_major_ver}"
    "${_pkg_lib_name}.so.${_pkg_lib_major_ver}.${_pkg_lib_minor_ver}.${_pkg_lib_patch_ver}"
)
conflicts=(
    "${_pkg_base_name}<$((${_pkg_base_major_ver} + 1))"
)
source=(
    https://github.com/qpdf/qpdf/releases/download/v"${pkgver}"/"${_pkg_base_name}"-"${pkgver}".tar.gz{,.asc}
)
sha256sums=(
    "defca435cf57d26f8a0619864841aa21f5469fddc6eb5662f62d8443021c069d"
    "SKIP"
)
validpgpkeys=(
    "C2C96B10011FE009E6D1DF828A75D10998012C7E" # "Jay Berkenbilt <ejb@ql.org>"
)

build() {
    cd ${_pkg_base_name}-${pkgver}
    cmake -S . -B build
    cmake --build build --target libqpdf
}

package() {
    cd "${srcdir}/${_pkg_base_name}-${pkgver}"

    mkdir -m 755 -p "${pkgdir}/usr/lib"
    install -m 644 build/libqpdf/libqpdf.so.${_pkg_lib_major_ver}.${_pkg_lib_minor_ver}.${_pkg_lib_patch_ver} "${pkgdir}/usr/lib/"
    ln --symbolic --relative "${pkgdir}/usr/lib/${_pkg_lib_name}.so.${_pkg_lib_major_ver}"{."${_pkg_lib_minor_ver}"."${_pkg_lib_patch_ver}",}

    mkdir -m 755 -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 {Artistic-2.0,LICENSE.txt} "${pkgdir}/usr/share/licenses/${pkgname}/"
}
