# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=efl-svn
pkgver=80292
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Ecore, Eet, Eina, Eio, Embryo, Eo, & Evas"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'custom')
depends=('mesa' 'curl' 'libjpeg>=7' 'giflib' 'libtiff' 'libwebp'
         'fontconfig' 'fribidi' 'harfbuzz' 'liblinebreak'
         'libxcomposite' 'libxcursor' 'libxinerama' 'libxp' 'libxrandr'
         'libxss' 'libxtst')
makedepends=('subversion')
optdepends=('python2: to compare Eina benchmarks'
            'evas_generic_loaders-svn: Extra loaders for Evas')
conflicts=('ecore' 'ecore-svn' 'eet' 'eet-svn' 'eina' 'eina-svn'
           'eio' 'eio-svn' 'embryo' 'embryo-svn' 'evas' 'evas-svn')
provides=('ecore' 'ecore-svn' 'eet' 'eet-svn' 'eina' 'eina-svn'
          'eio' 'eio-svn' 'embryo' 'embryo-svn' 'evas' 'evas-svn')
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

  sed -i 's:#!/usr/bin/env\ python:#!/usr/bin/python2:g' \
    src/scripts/eina/eina-bench-cmp

  ./autogen.sh --prefix=/usr \
	--libexecdir=/usr/lib \
	--enable-fb \
	--enable-software-xlib \
	--enable-gl-xlib \
	--disable-wayland-shm \
	--disable-pixman

  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install

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
