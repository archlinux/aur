# Contributor: ant32 <antreimer@gmail.com>
pkgname=mingw-w64-postgresql-libs
pkgver=9.5.2
pkgrel=1
pkgdesc="Libraries for use with PostgreSQL (mingw-w64)"
arch=(any)
url="http://www.postgresql.org"
license=("custom:PostgreSQL")
makedepends=(mingw-w64-configure libxml2)
depends=(mingw-w64-gettext "mingw-w64-openssl>=1.0.0" mingw-w64-libxml2)
options=(staticlibs !strip !buildflags)
source=("http://ftp.postgresql.org/pub/source/v${pkgver}/postgresql-${pkgver}.tar.bz2"
"postgresql-9.4.1-mingw-link.patch")
sha256sums=('f8d132e464506b551ef498719f18cfe9d777709c7a1589dc360afc0b20e47c41'
            '0f2b5c7edb48dd106900854c9323ca2d483054595c4cf8a5b796a1d536d22aad')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd postgresql-$pkgver
	patch -p1 -i ${srcdir}/postgresql-9.4.1-mingw-link.patch
}

build() {
	cd postgresql-$pkgver
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure \
			--with-openssl \
			--enable-thread-safety \
			--enable-nls \
			--with-libxml \
			--with-openssl

		# Make DLL definition file visible during each arch build
		ln -s "${srcdir}/postgresql-$pkgver/src/interfaces/libpq/libpqdll.def" src/interfaces/libpq/
		ln -s "${srcdir}/postgresql-$pkgver/src/interfaces/ecpg/ecpglib/libecpgdll.def" src/interfaces/ecpg/ecpglib/
		ln -s "${srcdir}/postgresql-$pkgver/src/interfaces/ecpg/pgtypeslib/libpgtypesdll.def" src/interfaces/ecpg/pgtypeslib/
		ln -s "${srcdir}/postgresql-$pkgver/src/interfaces/ecpg/compatlib/libecpg_compatdll.def" src/interfaces/ecpg/compatlib/

    make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "$srcdir/postgresql-$pkgver/build-${_arch}"
		mkdir -p "${pkgdir}/usr/${_arch}/"{bin,include,lib}

		make DESTDIR=$pkgdir install
		
		mv "$pkgdir/usr/${_arch}/lib/"*.dll "$pkgdir/usr/${_arch}/bin/"
		find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
		rm -r "$pkgdir/usr/${_arch}/share"
		
		# these headers are needed by the not-so-public headers of the interfaces
		cd "${srcdir}/postgresql-$pkgver/src/include"
		mkdir -p "${pkgdir}"/usr/${_arch}/include/{libpq,postgresql/internal/libpq}
		install -m644 c.h "${pkgdir}/usr/${_arch}/include/postgresql/internal/"
		install -m644 port.h "${pkgdir}/usr/${_arch}/include/postgresql/internal/"
		install -m644 postgres_fe.h "${pkgdir}/usr/${_arch}/include/postgresql/internal/"
		install -m644 libpq/pqcomm.h "${pkgdir}/usr/${_arch}/include/postgresql/internal/libpq/"
	done
}
