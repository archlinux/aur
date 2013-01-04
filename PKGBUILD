# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=efl-svn
pkgver=82175
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Ecore, EDBus, Edje, Eet, Eeze, Efreet, Eina, Eio, Embryo, Eo, Ephysics, & Evas"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'custom')
depends=('curl' 'dbus' 'mesa' 'giflib' 'libtiff' 'libpng' 'libpulse' 'udev'
         'bullet' 'lua' 'fontconfig' 'fribidi' 'harfbuzz' 'liblinebreak' 'libxp'
         'libxcomposite' 'libxcursor' 'libxinerama' 'libxss' 'shared-mime-info')
makedepends=('subversion')
optdepends=('python2: compare Eina benchmarks or run inkscape2edc'
            'evas_generic_loaders-svn: More video/graphics/icon loaders for Evas')
conflicts=('ecore' 'ecore-svn' 'edbus' 'edbus-svn' 'edje' 'edje-svn'
           'eet' 'eet-svn' 'eeze' 'eeze-svn' 'efreet' 'efreet-svn'
           'eina' 'eina-svn' 'eio' 'eio-svn' 'embryo' 'embryo-svn'
           'ephysics' 'ephysics-svn' 'evas' 'evas-svn')
provides=('ecore' 'ecore-svn' 'edbus' 'edbus-svn' 'edje' 'edje-svn'
          'eet' 'eet-svn' 'eeze' 'eeze-svn' 'efreet' 'efreet-svn'
          'eina' 'eina-svn' 'eio' 'eio-svn' 'embryo' 'embryo-svn'
          'ephysics' 'ephysics-svn' 'evas' 'evas-svn')
install=efl.install
options=('!libtool' '!emptydirs')
         
_svntrunk="http://svn.enlightenment.org/svn/e/trunk/efl"
_svnmod="efl"

build() {
  cd "$srcdir"

  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  sed -i 's:#!/usr/bin/env python:#!/usr/bin/python2:g' \
    "$srcdir/$_svnmod-build/src/scripts/eina/eina-bench-cmp"

  ./autogen.sh --prefix=/usr \
	--with-profile=release \
	--with-x11=xlib \
	--with-opengl=full \
	--enable-harfbuzz \
	--enable-physics \
	--enable-fb \
	--disable-tslib

  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make -j1 DESTDIR="$pkgdir" install

# install license files
  install -Dm644 "$srcdir/$_svnmod-build/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "$srcdir/$_svnmod-build/AUTHORS" \
        "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 "$srcdir/$_svnmod-build/licenses/COPYING.BSD" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING.BSD"
  install -Dm644 "$srcdir/$_svnmod-build/licenses/COPYING.SMALL" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING.SMALL"

  rm -r "$srcdir/$_svnmod-build"
}
