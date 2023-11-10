# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

pkgname=mingw-w64-postgresql
pkgver=16.1
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
        '0002-Use-pthread-library-from-MinGW.patch')
sha256sums=('ce3c4d85d19b0121fe0d3f8ef1fa601f71989e86f8a66f7dc3ad546dd5564fec'
            '44b1cceb0f5ef792acc00e9415dc2f7f777747199078ce4c8704d3420de52cf5'
            '72e627524dd4994d85db43ea02d71b2c9983037306a85822f744e76b40f40f2f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd postgresql-$pkgver
  patch -p1 -i ${srcdir}/0001-Use-.dll.a-as-extension-for-import-libraries.patch
  patch -p1 -i ${srcdir}/0002-Use-pthread-library-from-MinGW.patch
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
