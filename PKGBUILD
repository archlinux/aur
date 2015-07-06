# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Mantas Mikulėnas <grawity at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>

_pkgname=eggdrop
pkgname=$_pkgname-cvs
pkgver=20130212
_pkgver=1.8.0
pkgrel=2
pkgdesc="The world's most popular Open Source IRC bot (with SASL patch.)"
arch=('i686' 'x86_64')
url="http://www.eggheads.org/"
license=('GPL2')
install=$pkgname.install
depends=('sh' 'tcl>=8.3' 'zlib')
makedepends=('cvs')
provides=($_pkgname)
conflicts=($_pkgname)
backup=("etc/$_pkgname.conf")
source=("https://gist.github.com/grawity/4455067/raw/94f37f43194404c5517afc5396faf383f1c82ab4/preinit-server.patch")
md5sums=('86cff26774af7a0fcf9b875888a660a5')

_cvssrv=cvs.eggheads.org
_cvsroot=:pserver:anoncvs:anoncvs@$_cvssrv:/usr/local/cvsroot
_cvsmod=$_pkgname${_pkgver//.0/}

build() {
  cd "$srcdir"
  msg "Connecting to $_cvssrv CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -D "${pkgver//.0/}" -f "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  # Don't complain about language files on startup.
  sed -i "s|\"./language\"|\"$_sharedir/$_pkgname/language\"|g" src/eggdrop.h
  
  # Apply preinit-server.patch to make SASL possible.
  patch -p1 < "$srcdir/preinit-server.patch"

  ./configure --with-tcllib='/usr/lib/libtcl8.6.so' \
              --with-tclinc='/usr/include/tcl.h'
  make config

  # Include LDFLAGS.
  sed -i "s|-L/usr/lib|${LDFLAGS}|g" Makefile                                         
  make
}

# Want multiple *unique* installations? Change the pkgname, it will just work.
_sharedir="/usr/share"
_modulesdir="/usr/lib/$_pkgname"
_scriptsdir="$_sharedir/$_pkgname/scripts"
_helpdir="$_sharedir/$_pkgname/help"
_bin="/usr/bin/$_pkgname"
_mandir="$_sharedir/man/man1"
readonly -a _sharedir _modulesdir _scriptsdir _helpdir _bin _mandir

package() {
  readonly eggtmp="$pkgdir/tmp"
  mkdir -p -m 0755 "$eggtmp"

  # This is ugly..

  cd "$srcdir/$_cvsmod-build"
  make DEST="$eggtmp" install

  find "$eggtmp" -name 'CONTENTS' -exec rm {} +

  mkdir -p -m 0755 "$pkgdir/etc" \
    "$pkgdir/usr/"{bin,lib} \
    "$pkgdir/$_sharedir/"{$_pkgname,doc,man/man1}

  cp -a "$eggtmp/modules-$_pkgver" "$pkgdir/$_modulesdir"
  cp "$eggtmp/eggdrop-$_pkgver" "$pkgdir/$_bin"
  cp "$eggtmp/doc/man1/$_pkgname.1" "$pkgdir/$_mandir/$_pkgname.1"
  rm -r "$eggtmp/doc/man1"
  cp -a "$eggtmp/doc" "$pkgdir/$_sharedir/doc/$_pkgname"

  for d in language scripts help text; do
    cp -a "$eggtmp/${d}" "$pkgdir/$_sharedir/$_pkgname"
  done

  sed -e '2d' \
    -e "1s@^.*@#!$_bin@" \
    -e "s@scripts/@$_scriptsdir/@g" \
    -e "s@help/@$_helpdir@g" \
    -e "s@modules/@$_modulesdir/@g" \
    eggdrop.conf > "$pkgdir/etc/$_pkgname.conf"

  rm -r "$eggtmp"
  find "$pkgdir/$_sharedir" -type f -exec chmod 0444 {} +
}

# vim:set ts=2 sw=2 et:
