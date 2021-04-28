# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: kreon <kreon@jnode.in>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Mantas Mikulėnas <grawity at gmail.com>

pkgname=eggdrop
pkgver=1.9.0
pkgrel=1
pkgdesc="The world's most popular Open Source IRC bot."
arch=('i686' 'x86_64')
url="http://www.eggheads.org/"
license=('GPL2')
depends=('tcl' 'openssl' 'bash')
source=("http://ftp.eggheads.org/pub/$pkgname/source/1.9/$pkgname-$pkgver.tar.gz"
        "http://ftp.eggheads.org/pub/$pkgname/source/1.9/$pkgname-$pkgver.tar.gz.asc"
        'dlopen.c' 'utf8.patch')
backup=("etc/$pkgname.conf")
sha512sums=('e78e220c8207361c6d7bda06be6d0094d747809ff8554fed2ce4a5fb63df1d87f8b82a98d4f0b98909042af8f6719f4a7bf548f864d3d6dfa8caa57b346d32dc'
            'SKIP'
            'e1d254a6adae76198f7e20729aaff5d01a0947cb07faed560574886c1ce3794242204ec0c2f5905584240b243bf36103fffbb06f4154c022228c1b701a070e5c'
            '7966d4d42994e44a0e571b89f1c66cb41f672d75e6ced7051d1ece23d8c209059c3565b41de950bf9c907701ce7a5e33a215b637587075ed300a002a58eda503')
validpgpkeys=('E01C240484DE7DBE190FE141E7667DE1D1A39AFF')

# Want multiple *unique* installations? Change the pkgname, it will just work.
_sharedir="/usr/share"
_modulesdir="/usr/lib/$pkgname"
_scriptsdir="$_sharedir/$pkgname/scripts"
_helpdir="$_sharedir/$pkgname/help"
_bin="/usr/bin/$pkgname"
_mandir="$_sharedir/man/man1"
readonly -a _sharedir _modulesdir _scriptsdir _helpdir _bin _mandir

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # UNCOMMENT IF YOU NEED UTF-8 SUPPORT
  #patch -p1 < "$srcdir/utf8.patch"

  # Don't complain about language files on startup.
  sed -i "s|\"./language\"|\"$_sharedir/$pkgname/language\"|g" src/eggdrop.h

  ./configure
  make config
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  # If this fails, theres a rather good chance something is broken.
  gcc -O2 "$srcdir/dlopen.c" -o dlopen -ldl

  for module in *.so ; do
    if ! env LD_PRELOAD='' ./dlopen "${module}" ; then
      echo "Sanity check failed: "${module}" cannot be loaded. Proceeding anyway.."
    fi
  done

  rm dlopen
}

package() {
  readonly eggtmp="$pkgdir/tmp"
  mkdir -p -m 0755 "$eggtmp"

  # This is ugly..

  cd "$srcdir/$pkgname-$pkgver"
  make install DEST="$eggtmp"

  find "$eggtmp" -name 'CONTENTS' -exec rm {} +

  mkdir -p -m 0755 "$pkgdir/etc" \
    "$pkgdir/usr/"{bin,lib} \
    "$pkgdir/$_sharedir/"{$pkgname,doc,man/man1}

  mv "$eggtmp/modules-$pkgver" "$pkgdir/$_modulesdir"
  mv "$eggtmp/eggdrop-$pkgver" "$pkgdir/$_bin"
  mv "$eggtmp/doc/man1/$pkgname.1" "$pkgdir/$_mandir/$pkgname.1"
  rm -r "$eggtmp/doc/man1"
  mv "$eggtmp/doc" "$pkgdir/$_sharedir/doc/$pkgname"

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
