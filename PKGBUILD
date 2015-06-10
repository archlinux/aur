# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=qemacs
pkgver=0.3.3
pkgrel=1
pkgdesc='Quick version of Emacs'
license=('LGPL2.1')
arch=('x86_64' 'i686')
url='http://bellard.org/qemacs/'
depends=('libxv')
conflicts=('qemacs-cvs')
provides=('qemacs')
makedepends=('texi2html' 'setconf')
install="$pkgname.install"
source=("http://bellard.org/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2ffba66a44783849282199acfcc08707debc7169394a8fd0902626222f27df94')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Patch a few compilation errors
  sed -i 's:static QEDisplay:QEDisplay:' tty.c
  sed -i 's:static QECharset:QECharset:' charset.c
  sed -i 's/ found:/ found: return q - buf_out;/g' unicode_join.c
  sed -i 's:static QEDisplay:QEDisplay:' x11.c

  # Stop doing ELF-acrobatics
  sed -i 's:GNUC:NOP:' qe.c

  # Configure
  ./configure --prefix=$pkgdir/usr --disable-png

  # Remove the blank line
  sed -i '/^$/d' config.mak
  # Remove the line with only "
  sed -i '/^"$/d' config.h
  # Add a " after 0.3.1
  sed -i 's:\.1:\.1":' config.h
  # Set the configuration path
  sed -i "/CONFIG_QE/d" config.h
  echo '#define CONFIG_QE_PREFIX "/usr"' >> config.h

  # Disable -Wall and -Werror (won't compile with gcc otherwise)
  setconf Makefile CFLAGS "-fno-strict-aliasing -g $CFLAGS"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Compile
  make -C libqhtml
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Binaries
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/qe"
  mkdir -p "$pkgdir/usr/man/man1"
  make --silent install

  # Manual
  mkdir -p "$pkgdir/usr/share/man"
  mv "$pkgdir/usr/man/man1" "$pkgdir/usr/share/man/man1"
  rmdir "$pkgdir/usr/man"
  ln -s "/usr/share/man/man1/qe.1.gz" "$pkgdir/usr/share/man/man1/qemacs.1.gz"

  # Configuration
  install -Dm644 config.eg "$pkgdir/usr/share/qe/config.eg"

  # Documentation
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 qe-doc.html "$pkgdir/usr/share/doc/$pkgname/qemacs.html"
  install -Dm644 config.eg "$pkgdir/usr/share/doc/$pkgname/sample-config"
  # util.c is mentioned in config.qe
  install -Dm644 util.c "$pkgdir/usr/share/doc/$pkgname/util.c"

  # License
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
