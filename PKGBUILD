# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: kreon <kreon@jnode.in>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Mantas Mikulėnas <grawity at gmail.com>

pkgname=eggdrop
pkgver=1.9.3
pkgrel=1
pkgdesc="The world's most popular Open Source IRC bot"
arch=(x86_64)
url=https://www.eggheads.org/
license=(GPL-2.0-only)
depends=(tcl openssl bash glibc zlib)
source=(
  "https://ftp.eggheads.org/pub/$pkgname/source/1.9/$pkgname-$pkgver.tar.gz"
  "https://ftp.eggheads.org/pub/$pkgname/source/1.9/$pkgname-$pkgver.tar.gz.asc"
)
backup=("etc/$pkgname.conf")
b2sums=('979190536c3c0718ef4b030d8f6df817b8ee823854c104b7d6f9009c10a7f8394d59afca40fc5c9778f130788fac7e14458d62d30a55413dea4653ca00c83f0a'
        'SKIP')
validpgpkeys=('E01C240484DE7DBE190FE141E7667DE1D1A39AFF')

build() {
  cd $pkgname-$pkgver

  # don't complain about language files on startup
  sed -i "s|\"./language\"|\"$_sharedir/$pkgname/language\"|g" src/eggdrop.h

  ./configure
  make config
  make
}

package() {
  _tmpinstall="$pkgdir/tmp"
  install -dm755 "$_tmpinstall"

  cd $pkgname-$pkgver
  make install DEST="$_tmpinstall"

  find "$_tmpinstall" -name 'CONTENTS' -exec rm {} +

  # install modules
  for mod in $(ls "$_tmpinstall/modules-$pkgver/"); do
   install -Dm644 "$_tmpinstall/modules-$pkgver/$mod" -t "$pkgdir/usr/lib/$pkgname/"
  done

  install -Dm755 "$_tmpinstall/eggdrop-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$_tmpinstall/doc/man1/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  rm -r "$_tmpinstall/doc/man1"
  install -dm755 "$pkgdir/usr/share/doc/"
  cp -r "$_tmpinstall/doc" "$pkgdir/usr/share/doc/$pkgname"

  install -dm755 "$pkgdir/usr/share/$pkgname"
  for d in language scripts help text; do
    cp -r "$_tmpinstall/${d}" -t "$pkgdir/usr/share/$pkgname/"
  done

  install -dm755 "$pkgdir/etc"
  sed -e '2d' \
    -e "1s@^.*@#!$_bin@" \
    -e "s@scripts/@$_scriptsdir/@g" \
    -e "s@help/@$_helpdir@g" \
    -e "s@modules/@$_modulesdir/@g" \
    $_tmpinstall/eggdrop.conf > "$pkgdir/etc/$pkgname.conf"

  rm -r "$_tmpinstall"
}

# vim:set ts=2 sw=2 et:
