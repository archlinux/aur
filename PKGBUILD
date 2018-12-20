# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Schala Zeal <schalaalexiazeal@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

_commit=d4f8423bbff9b3c5fca2d8009c28d1cff4652788  # tags/dbus-1.12.12^0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-dbus
pkgver=1.12.12
pkgrel=1
pkgdesc="Freedesktop.org message bus system (mingw-w64)"
arch=('any')
url="https://wiki.freedesktop.org/www/Software/dbus/"
license=('custom' 'GPL')
depends=('mingw-w64-expat')
makedepends=('mingw-w64-configure'
             'docbook-xsl'
             'autoconf-archive'
             'git')
provides=('mingw-w64-libdbus')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://anongit.freedesktop.org/git/dbus/dbus#commit=${_commit}")
sha256sums=('SKIP')

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

# vim:set ts=2 sw=2 et:
