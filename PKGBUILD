# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=qemacs
pkgver=0.3.3
pkgrel=3
pkgdesc='Lightweight Emacs'
license=('LGPL2.1')
arch=(x86_64)
url='https://bellard.org/qemacs/'
depends=(libxv)
makedepends=(setconf texi2html)
source=("https://bellard.org/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2ffba66a44783849282199acfcc08707debc7169394a8fd0902626222f27df94')

prepare() {
  cd "$pkgname-$pkgver"

  # fix compilation errors
  sed -i 's:static QEDisplay:QEDisplay:' tty.c
  sed -i 's:static QECharset:QECharset:' charset.c
  sed -i 's/ found:/ found: return q - buf_out;/g' unicode_join.c
  sed -i 's:static QEDisplay:QEDisplay:' x11.c

  # stop doing ELF-acrobatics
  sed -i 's:GNUC:NOP:' qe.c

  export LDFLAGS="$LDFLAGS -Wl,-z,now"
  ./configure --prefix=$pkgdir/usr --disable-png

  # fix config before building
  sed -i '/^$/d' config.mak
  sed -i '/^"$/d' config.h
  sed -i 's:\.1:\.1":' config.h
  sed -i "/CONFIG_QE/d" config.h
  echo '#define CONFIG_QE_PREFIX "/usr"' >> config.h
  setconf Makefile CFLAGS "-fno-strict-aliasing -g $CFLAGS"
}

build() {
  cd "$pkgname-$pkgver"
  make -C libqhtml
  make
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/qe"
  install -d "$pkgdir/usr/man/man1"

  # install
  make --silent install

  # man page fix
  mkdir -p "$pkgdir/usr/share/man"
  mv "$pkgdir/usr/man/man1" "$pkgdir/usr/share/man/man1"
  rmdir "$pkgdir/usr/man"
  ln -s "/usr/share/man/man1/qe.1.gz" "$pkgdir/usr/share/man/man1/qemacs.1.gz"

  # shared files
  install -Dm644 config.eg "$pkgdir/usr/share/qe/config.eg"
  install -Dm644 util.c "$pkgdir/usr/share/doc/$pkgname/util.c"

  # documentation
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 qe-doc.html "$pkgdir/usr/share/doc/$pkgname/qemacs.html"
  install -Dm644 config.eg "$pkgdir/usr/share/doc/$pkgname/sample-config"

  # license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
