# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Mantas Mikulėnas <grawity at gmail.com>

pkgname=eggdrop
pkgver=1.6.21
pkgrel=5
pkgdesc="The world's most popular Open Source IRC bot."
arch=('i686' 'x86_64')
url="http://www.eggheads.org/"
license=('GPL2')
depends=('sh' 'tcl>=8.3' 'zlib')
source=("http://ftp.eggheads.org/pub/$pkgname/source/1.6/$pkgname$pkgver.tar.bz2"
        'dlopen.c')
backup=("etc/$pkgname.conf")
options=('!makeflags')
sha256sums=('75bd5573a609eac3940c0b6ca8251c3f38ea5d54b520e1cad93c650b4bc21754'
            'd1758f84a69173a852e598fa55e69df0d73b8b62c6993b0ba04aa21d539213e6')

# Want multiple *unique* installations? Change the pkgname, it will just work.
_sharedir="/usr/share"
_modulesdir="/usr/lib/$pkgname"
_scriptsdir="$_sharedir/$pkgname/scripts"
_helpdir="$_sharedir/$pkgname/help"
_bin="/usr/bin/$pkgname"
_mandir="$_sharedir/man/man1"
readonly -a _sharedir _modulesdir _scriptsdir _helpdir _bin _mandir

build() {
  cd "$srcdir/$pkgname$pkgver"

  # Don't complain about language files on startup.
  sed -i "s|\"./language\"|\"$_sharedir/$pkgname/language\"|g" src/eggdrop.h

  ./configure --with-tcllib='/usr/lib/libtcl8.6.so' \
              --with-tclinc='/usr/include/tcl.h'
  make config

  # Include LDFLAGS.
  sed -i "s|-L/usr/lib|${LDFLAGS}|g" Makefile
  make
}

check() {
  cd "$srcdir/$pkgname$pkgver"

  # If this fails, theres a rather good chance something is broken.

  gcc -O2 "$srcdir/dlopen.c" -o dlopen -ldl

  for module in *.so ; do
    if ! env LD_PRELOAD='' ./dlopen "${module}" ; then
      error "Sanity check failed: "${module}" cannot be loaded. Proceeding anyway.."
    fi
  done

  rm dlopen
}

package() {
  readonly eggtmp="$pkgdir/tmp"
  mkdir -p -m 0755 "$eggtmp"

  # This is ugly..

  cd "$srcdir/$pkgname$pkgver"
  make DEST="$eggtmp" install

  find "$eggtmp" -name 'CONTENTS' -exec rm {} +

  mkdir -p -m 0755 "$pkgdir/etc" \
    "$pkgdir/usr/"{bin,lib} \
    "$pkgdir/$_sharedir/"{$pkgname,doc,man/man1}

  mv "$eggtmp/modules-$pkgver" "$pkgdir/$_modulesdir"
  mv "$eggtmp/eggdrop-$pkgver" "$pkgdir/$_bin"
  mv "$eggtmp/doc/man1/$pkgname.1" "$pkgdir/$_mandir/$pkgname.1"
  rm -r "$eggtmp/doc/man1"
  mv "$eggtmp/doc" "$pkgdir/$_sharedir/doc/$pkgname-$pkgver"

  for d in language scripts help text; do
    mv "$eggtmp/${d}" "$pkgdir/$_sharedir/$pkgname"
  done

  sed -e '2d' \
    -e "1s@^.*@#!$_bin@" \
    -e "s@scripts/@$_scriptsdir/@g" \
    -e "s@help/@$_helpdir@g" \
    -e "s@modules/@$_modulesdir/@g" \
    eggdrop.conf > "$pkgdir/etc/$pkgname.conf"

  rm -r "$eggtmp"
  find "$pkgdir/$_sharedir" -type f -exec chmod 0444 {} +
}

# vim:set ts=2 sw=2 et:
