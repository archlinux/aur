# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-dbus
pkgver=1.10.16
pkgrel=1
_commit=8b582cb10d7cf00af7a70496aec48af24edc542b
arch=(any)
pkgdesc="Freedesktop.org message bus system (mingw-w64)"
depends=(mingw-w64-expat)
makedepends=(mingw-w64-configure docbook-xsl git)
options=(!strip !buildflags staticlibs !emptydirs)
conflicts=(mingw-w64-libdbus)
provides=(mingw-w64-libdbus)
replaces=(mingw-w64-libdbus)
license=("custom" "GPL")
url="https://wiki.freedesktop.org/www/Software/dbus/"
source=("git+https://anongit.freedesktop.org/git/dbus/dbus#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('DA98F25C0871C49A59EAFF2C4DE8FF2A63C7CC90'  # Simon McVittie <simon.mcvittie@collabora.co.uk>
              '3C8672A0F49637FE064AC30F52A43A1E4B77B059') # Simon McVittie <simon.mcvittie@collabora.co.uk>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/dbus"
  git describe --tags | sed 's/^dbus-//;s/-/+/g'
}

prepare() {
	cd "${srcdir}/dbus"
	git cherry-pick -n 09cb6d7b467f6d1c6685ee9ccc171f4dddbe1f42
  NOCONFIGURE=1 ./autogen.sh
	sed -i 's,THREAD_LIBS="$THREAD_LIBS -lrt",THREAD_LIBS="$THREAD_LIBS",' configure
}

build() {
	cd "${srcdir}/dbus"
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
			--disable-verbose-mode \
			--disable-xml-docs \
			--disable-doxygen-docs \
			--disable-ducktype-docs
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/dbus/build-${_arch}"
		make DESTDIR="${pkgdir}" install
		find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip {} \;
		find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
		find "${pkgdir}/usr/${_arch}" -name "*.a" -o -name "*.dll" | xargs ${_arch}-strip -g
	done
}
