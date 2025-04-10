# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: Filip Brcic < brcha at gna dot org >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-dbus
pkgver=1.16.2
pkgrel=1
pkgdesc="Freedesktop.org message bus system (mingw-w64)"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/dbus/"
license=('AFL-2.1 OR GPL-2.0-or-later')
depends=('mingw-w64-expat')
makedepends=('mingw-w64-meson'
             'docbook-xsl'
             'git')
provides=('mingw-w64-libdbus')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://gitlab.freedesktop.org/dbus/dbus.git#tag=dbus-${pkgver}")
b2sums=('669cd4203fbac908db3a20c5b51355d9e84b68c9cc94f8de52e35544a636c6d5d1df8ee2bbdfd6dead53a6bd9865db547aa4af0e913bac697b138c698840d3ce')

build() {
  cd "${srcdir}/dbus"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-meson \
      --buildtype=release \
      --default-library=both \
      -D 'doxygen_docs=disabled' \
      -D 'xml_docs=disabled' \
      -D 'qt_help=disabled' \
      ..
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/dbus/build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.a" -o -name "*.dll" | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
