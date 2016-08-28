# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-dbus
pkgver=1.10.10
pkgrel=1
arch=(any)
pkgdesc="Freedesktop.org message bus system (mingw-w64)"
depends=(mingw-w64-expat)
makedepends=(mingw-w64-configure docbook-xsl)
options=(!strip !buildflags staticlibs !emptydirs)
conflicts=(mingw-w64-libdbus)
provides=(mingw-w64-libdbus)
replaces=(mingw-w64-libdbus)
license=("custom" "GPL")
url="http://www.freedesktop.org/wiki/Software/dbus"
source=("http://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.gz"{,.asc})
md5sums=('495676d240eb982921b3ad1343526849'
         'SKIP')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "${srcdir}/dbus-${pkgver}"
	sed -i 's,THREAD_LIBS="$THREAD_LIBS -lrt",THREAD_LIBS="$THREAD_LIBS",' configure
}

build() {
	cd "${srcdir}/dbus-${pkgver}"
	unset LDFLAGS
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure \
			--target=${_arch} \
			--with-xml=expat \
			--disable-systemd \
			--disable-tests \
			--disable-Werror \
			--disable-asserts \
			--disable-verbose-mode
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/dbus-${pkgver}/build-${_arch}"
		make DESTDIR="${pkgdir}" install
		find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip {} \;
		find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
		find "${pkgdir}/usr/${_arch}" -name "*.a" -o -name "*.dll" | xargs ${_arch}-strip -g
	done
}
