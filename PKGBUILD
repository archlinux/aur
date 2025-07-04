# Maintainer: envolution
# Contributer: Blisfull <narthana.epa@gmail.com>
# Contributer: SahibBommelig <sahib@online.de>
# Contributor: tee < teeaur at duck dot com >
# shellcheck shell=bash disable=SC2034,SC2154
 
pkgname=rmlint
pkgver=2.10.3
pkgrel=4
pkgdesc="remove duplicates and other lint - includes gui (shredder)"
arch=('i686' 'x86_64')
url="https://github.com/sahib/rmlint"
license=('GPL-3.0-only')
provides=(rmlint-shredder)
depends=(
  glib2
  libelf
  json-glib
  python-gobject
  python-cairo
  gtksourceview4
  librsvg
  util-linux-libs
)

makedepends=(
  scons
  python-sphinx
  python-sphinx-bootstrap-theme
  python-setuptools
  gettext
)

checkdepends=(
  python-pytest
  python-xattr
  python-psutil
  btrfs-progs
  patchelf
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
    scons config
    scons -j${_jval} VERBOSE=1 DEBUG=1 --prefix=${pkgdir}/usr --actual-prefix=/usr
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # backup binary
    cp ./rmlint ./rmlint.backup
    # Set rpath for tests that require the library to be 'installed'
    patchelf --set-rpath '$ORIGIN' ./rmlint
    # run tests - we use pytest instead of scons because scons test removes our rpath
    LD_LIBRARY_PATH="${PWD}:$LD_LIBRARY_PATH" pytest tests -k 'not slow'
    # restore original binary
    mv ./rmlint.backup ./rmlint
}
 
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    scons DEBUG=1 --prefix=${pkgdir}/usr install --actual-prefix=/usr
    find "$pkgdir" -type f -name gschemas.compiled -delete
}
# vim:set ts=2 sw=2 et:
