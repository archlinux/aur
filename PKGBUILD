# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

pkgname=mingw-w64-postgresql
pkgver=17.5
pkgrel=1
pkgdesc='Sophisticated object-relational DBMS (mingw-w64)'
arch=('any')
url='https://www.postgresql.org'
license=('custom:PostgreSQL')
makedepends=('mingw-w64-configure' 'libxml2')
depends=('mingw-w64-gettext' 'mingw-w64-openssl>=1.0.0' 'mingw-w64-libxml2' 'mingw-w64-readline' 'mingw-w64-icu')
options=(staticlibs !strip !buildflags)
provides=('mingw-w64-postgresql-libs')
conflicts=('mingw-w64-postgresql-libs')
replaces=('mingw-w64-postgresql-libs')
source=("http://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2"
        '0001-Use-.dll.a-as-extension-for-import-libraries.patch'
        '0002-Use-pthread-library-from-MinGW.patch'
        '0003-Disable-wsa-invalid-event-static-assert.patch'
        '0004-Use-mingw-setjmp-on-ucrt.patch')
sha256sums=('fcb7ab38e23b264d1902cb25e6adafb4525a6ebcbd015434aeef9eda80f528d8'
            '8eac518a21bbee6cbb8ea2e1a7ebe8f4596b5145ccac68044a964462b2c7be73'
            '6df4579b315cca673a7701b75318814cd9abe451019002829cc6021d947d9504'
            'cb9cd63f8b137d35c7f6c9d7a4c202d2fa3c2c01ceaec148936e21e812e3976f'
            '48408df2e4326a5360809a363194d4b8ad28047bd0cf7a3c321dfc5c3f8b2710')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd postgresql-$pkgver
  patch -p1 -i "${srcdir}"/0001-Use-.dll.a-as-extension-for-import-libraries.patch
  patch -p1 -i "${srcdir}"/0002-Use-pthread-library-from-MinGW.patch
  patch -p1 -i "${srcdir}"/0003-Disable-wsa-invalid-event-static-assert.patch
  patch -p1 -i "${srcdir}"/0004-Use-mingw-setjmp-on-ucrt.patch
}

build() {
  cd postgresql-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    PATH=/usr/${_arch}/bin:$PATH ${_arch}-configure \
      --enable-thread-safety \
      --enable-nls \
      --with-libxml \
      --with-openssl \
      --disable-rpath

    # Make DLL definition file visible during each arch build
    ln -s "${srcdir}/postgresql-$pkgver/src/interfaces/libpq/libpqdll.def" src/interfaces/libpq/
    ln -s "${srcdir}/postgresql-$pkgver/src/interfaces/ecpg/ecpglib/libecpgdll.def" src/interfaces/ecpg/ecpglib/
    ln -s "${srcdir}/postgresql-$pkgver/src/interfaces/ecpg/pgtypeslib/libpgtypesdll.def" src/interfaces/ecpg/pgtypeslib/
    ln -s "${srcdir}/postgresql-$pkgver/src/interfaces/ecpg/compatlib/libecpg_compatdll.def" src/interfaces/ecpg/compatlib/

    make

    # Build static lib
    ${_arch}-ar rvs -o libpq.a src/interfaces/libpq/*.o
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/postgresql-$pkgver/build-${_arch}"
    mkdir -p "${pkgdir}/usr/${_arch}/"{bin,include,lib}

    make DESTDIR=$pkgdir install
    mv libpq.a "${pkgdir}/usr/${_arch}/lib/"
    mv "$pkgdir/usr/${_arch}/lib/"*.dll "$pkgdir/usr/${_arch}/bin/"

    find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip --strip-all {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.a" -exec ${_arch}-strip -g {} \;

    # these headers are needed by the not-so-public headers of the interfaces
    cd "${srcdir}/postgresql-$pkgver/src/include"
    mkdir -p "${pkgdir}"/usr/${_arch}/include/{libpq,postgresql/internal/libpq}
    install -m644 c.h "${pkgdir}/usr/${_arch}/include/postgresql/internal/"
    install -m644 port.h "${pkgdir}/usr/${_arch}/include/postgresql/internal/"
    install -m644 postgres_fe.h "${pkgdir}/usr/${_arch}/include/postgresql/internal/"
    install -m644 libpq/pqcomm.h "${pkgdir}/usr/${_arch}/include/postgresql/internal/libpq/"
  done
}
