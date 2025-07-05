# Maintainer: envolution
# Contributer: Blisfull <narthana.epa@gmail.com>
# Contributer: SahibBommelig <sahib@online.de>
# Contributor: tee < teeaur at duck dot com >
# shellcheck shell=bash disable=SC2034,SC2154
 
pkgname=rmlint
pkgver=2.10.3
pkgrel=7
pkgdesc="remove duplicates and other lint (without-gui)"
arch=('i686' 'x86_64')
url="https://github.com/sahib/rmlint"
license=('GPL-3.0-only')
depends=(
  glib2
  glibc
  libelf
  python
  json-glib
  util-linux-libs
)

makedepends=(
  scons
  gettext
  python-sphinx
  python-sphinx-bootstrap-theme
)

checkdepends=(
  python-psutil
  python-pytest
  python-xattr
  python-pygal
  python-tests
  python-utils
  btrfs-progs
  patchelf
  man-db
  dash
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('8ffdbd5d09d15c8717ae55497e90d6fa46f085b45ac1056f2727076da180c33e')
 
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    #build with shared libs
    sed -i -E 's/env\.Library/env\.SharedLibrary/' lib/SConscript
    sed -i -E "s/INSTALL_LIBRARY = False/INSTALL_LIBRARY = True/" lib/SConscript
}
build() {
	  [[ $MAKEFLAGS =~ -j[[:space:]]*([0-9]+) ]] &&
    _jval="${BASH_REMATCH[1]}" || _jval=1
    cd "${srcdir}/${pkgname}-${pkgver}"
    scons -j${_jval} DEBUG=1 --prefix=${pkgdir}/usr --actual-prefix=/usr --without-gui
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # backup binary
    cp ./rmlint ./rmlint.backup
    # Set rpath for tests that require the library to be 'installed'
    patchelf --set-rpath '$ORIGIN' ./rmlint
    LD_LIBRARY_PATH="${PWD}:$LD_LIBRARY_PATH" pytest tests -k 'not slow'
    # restore original binary
    mv ./rmlint.backup ./rmlint
}
 
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    scons DEBUG=1 --prefix=${pkgdir}/usr install --actual-prefix=/usr --without-gui
    find "$pkgdir" -type f -name gschemas.compiled -delete
}
# vim:set ts=2 sw=2 et:
