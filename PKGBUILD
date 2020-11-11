# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=qt-lua
_pkgname=libqtlua
pkgdesc='Lua scripting API for Qt applications'
pkgver=2.1
pkgrel=2
arch=('i686' 'x86_64')
url='http://www.nongnu.org/libqtlua/'
license=('LGPL')
makedepends=()
depends=(qt5-base lua)

source=("http://download.savannah.gnu.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "lua54.patch")
sha256sums=('963e9f73ae9dd830f69e8c2ab73d4de69ce80caac6c28d25dca2f8628eedab5f'
            'ea2dea0412b42ed1188a188bdba37694a24b60b12236df9726e2cd3c3f062bce')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p0 -i "${srcdir}/lua54.patch"
}

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    # HACK: The explicit LUA_LIBRARY is necessary due to CMake finding
    # a liblua5.2.so, but Lua 5.3 header files with no liblua5.3.so when
    # both lua and lua52 are installed.  I'm not sure whether this should
    # be fixed in CMake or Arch's lua package, but this fixes it for now
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DLUA_LIBRARY=/usr/lib64/liblua.so \
          "${srcdir}/${_pkgname}-${pkgver}"

    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}
