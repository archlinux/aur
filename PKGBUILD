# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=qemacs
pkgver=0.3.3
pkgrel=4
pkgdesc='Quick Emacs'
license=('LGPL2.1')
arch=(x86_64)
url='https://bellard.org/qemacs/'
source=("https://bellard.org/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2ffba66a44783849282199acfcc08707debc7169394a8fd0902626222f27df94')

build() {
  # TODO: Make UTF-8 default
  cd "$pkgname-$pkgver"
  export CC=gcc
  export CFLAGS="$CFLAGS \
    -DQE_VERSION=\"'$pkgver'\" \
    -DCONFIG_QE_PREFIX=\"'/usr'\" \
    -DCONFIG_NETWORK=1 \
    -DCONFIG_UNICODE_JOIN=1 \
    -DCONFIG_ALL_KMAPS=1 \
    -D__NOP__=1 \
    -fno-strict-aliasing -pipe -Os -w"
  export LDFLAGS="$LDFLAGS -Wl,-z,now -Wl,--as-needed"
  "$CC" qe.c qe.h qfribidi.h charset.c buffer.c input.c unicode_join.c display.c \
    util.c hex.c list.c cutils.c unix.c tty.c clang.c latex-mode.c xml.c \
    bufed.c shell.c dired.c charsetmore.c charset_table.c arabic.c indic.c \
    qfribidi.c unihex.c qeend.c $CFLAGS $LDFLAGS -o qe
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 qe "$pkgdir/usr/bin/qe"
  ln -s /usr/bin/qe "$pkgdir/usr/bin/qemacs"

  # shared files
  install -Dm644 kmaps "$pkgdir/usr/share/qe/kmaps"
  install -Dm644 ligatures "$pkgdir/usr/share/qe/ligatures"

  # man page and HTML documentation
  install -Dm755 qe.1 "$pkgdir/usr/share/man/man1/qe.1"
  ln -s /usr/share/man/man1/qe.1.gz "$pkgdir/usr/share/man/man1/qemacs.1.gz"
  install -Dm644 qe-doc.html "$pkgdir/usr/share/doc/$pkgname/qemacs.html"

  # license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
