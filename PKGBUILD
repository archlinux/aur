# Contributor: Filip Brcic <brcha@gna.org>
pkgname=mingw-w64-dbus
pkgver=1.12.6
pkgrel=1
_commit=a723baa2bc7e91fc9b1926cda1ce53e9301de4d8  # tags/dbus-1.12.6^0
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

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/dbus"
  git describe --tags | sed 's/^dbus-//;s/-/+/g'
}

prepare() {
	cd "${srcdir}/dbus"
	NOCONFIGURE=1 ./autogen.sh
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

