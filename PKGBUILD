# Maintainer: Scimmia <scimmia22 at outlook dot com>

pkgname=efl-svn
pkgver=78901
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries - Eo, Eet, Eina, Embryo, & Evas"
arch=('i686' 'x86_64')
groups=('e17-libs-svn' 'e17-svn')
url="http://www.enlightenment.org"
license=('BSD' 'LGPL2.1')
depends=('libjpeg-turbo' 'openssl' 'glibc' 'libxrender' 'mesa' 'glu' 'libpng'
         'giflib' 'libtiff' 'librsvg' 'libwebp' 'fontconfig' 'fribidi'
         'liblinebreak' 'evas_generic_loaders-svn')
makedepends=('subversion')
optdepends=('python2: to compare Eina benchmarks'
            'harfbuzz: complex text shaping and layout - needed with some languages')
conflicts=('eet' 'eet-svn' 'eina' 'eina-svn' 'embryo' 'embryo-svn'
           'evas' 'evas-svn')
provides=('eet' 'eet-svn' 'eina' 'eina-svn' 'embryo' 'embryo-svn'
          'evas' 'evas-svn')
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
	--enable-gl-xlib
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 "$srcdir/$_svnmod-build/licenses/COPYING.BSD" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING.BSD"
  install -Dm644 "$srcdir/$_svnmod-build/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  rm -r "$srcdir/$_svnmod-build"
}
