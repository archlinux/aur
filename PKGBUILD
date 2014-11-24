# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>

_pkgname=vsqlite++
pkgname=mingw-w64-${_pkgname}
pkgver=0.3.13
pkgrel=2
_pkgdesc='SQLite wrapper library for C++'
pkgdesc="${_pkgdesc} (mingw-w64)"
arch=('any')
url='http://sourceforge.net/projects/sqlitepp/'
license=('custom')
depends=('mingw-w64-sqlite' 'mingw-w64-crt')
makedepends=('mingw-w64-boost' 'mingw-w64-configure' 'mingw-w64-gcc')
options+=('!strip' 'staticlibs' '!buildflags')
source=(
    "http://downloads.sourceforge.net/sqlitepp/${_pkgname}-${pkgver}.tar.gz"
    'vsqlite++.patch'
)
sha256sums=(
    '67887fe7e27159fc83de271a015c322d40bb760f1a7ac5ae9c1d40291a90d39d'
    'ed8b9d3f849b3fe1169d9e17302e63352f7029aa54f0ea2058fdea1673d7867d'
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "${srcdir}/${_pkgname}-$pkgver"
    patch -p 1 -i ../vsqlite++.patch
}

build() {
    cd "${srcdir}/${_pkgname}-$pkgver/"
    autoreconf --install --verbose --force
    for _arch in ${_architectures}
    do
        mkdir -p build-${_arch} && pushd build-${_arch}
        ${_arch}-configure
        make
        popd
    done
}

package() {
    for _arch in ${_architectures}
    do
        cd "${srcdir}/${_pkgname}-$pkgver/build-${_arch}"
        make DESTDIR="${pkgdir}" install
        install -D -m0644 ../COPYING "${pkgdir}/usr/${_arch}/share/licenses/vsqlite++/COPYING"
        ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
        ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    done
}

