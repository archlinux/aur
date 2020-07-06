# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: Filip Brcic < brcha at gna dot org >

_commit=ab88811768f750777d1a8b9d9ab12f13390bfd3a  # tags/dbus-1.12.20^0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-dbus
pkgver=1.12.20
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
source=("git+https://gitlab.freedesktop.org/dbus/dbus.git#commit=${_commit}")
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
