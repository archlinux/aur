# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: kreon <kreon@jnode.in>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Mantas Mikulėnas <grawity at gmail.com>

pkgname=eggdrop
pkgver=1.9.3
pkgrel=1
pkgdesc="The world's most popular Open Source IRC bot."
arch=('x86_64')
url="http://www.eggheads.org/"
license=('GPL2')
depends=('tcl' 'openssl' 'bash')
source=("http://ftp.eggheads.org/pub/$pkgname/source/1.9/$pkgname-$pkgver.tar.gz"
        "http://ftp.eggheads.org/pub/$pkgname/source/1.9/$pkgname-$pkgver.tar.gz.asc"
        'dlopen.c' 'utf8.patch')
backup=("etc/$pkgname.conf")
b2sums=('979190536c3c0718ef4b030d8f6df817b8ee823854c104b7d6f9009c10a7f8394d59afca40fc5c9778f130788fac7e14458d62d30a55413dea4653ca00c83f0a'
        'SKIP'
        '7aa626e67793815e8fb5957ce706c7d4807671d780267cbde3f03ce1f1f4b2c35282c921b669c955b6b17fef81b966db5e70cb82fc7095c10d6a5c7e625ee8cd'
        '5df161e9f90f54b1ee2e12bbe06d74d01b26e6c35cca9d12225e448874c7ba9c4c571df6c84e968483acc3a22d5259b2cc9519dda626b025577309b4952a3d1c')
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
