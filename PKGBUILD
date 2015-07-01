# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=unshake
pkgver=1.5r1
pkgrel=3
pkgdesc="Sharpens photos which are blurred, poorly focused or shaken"
arch=('any')
if [ $CARCH == "i686" ]; then
  arch=('i686')
fi
url="http://www.unshake.co.uk/"
license=('custom')
depends=('java-runtime')
makedepends_i686=('netpbm')
optdepends_i686=('netpbm: unshake command-line tool for PNM files')
install=unshake.install
source=(http://www.zen147963.zen.co.uk/Unshake/Unshake15r1.zip unshake.sh LICENSE)
md5sums=('7082391e5862217f70f747552ea9138a'
         '70761d25da1fcd9de1c89d84b836384c'
         '784de31896415c2f6a09862c83831a56')

package() {
  cd "$srcdir/Unshake"
  # install java version (the main program)
  install -D -m644 Unshake.jar "$pkgdir"/usr/share/java/$pkgname/Unshake.jar
  install -D -m755 "$srcdir"/unshake.sh "$pkgdir"/usr/bin/unshake

  if [ $CARCH == "i686" ]; then
    # install C version
    tar xf UnshakeC$pkgver.tar.gz
    cd UnshakeC$pkgver
    make LOPTS="-lnetpbm -lm -L. -L/usr/local/lib -lUnshake -lphase" \
      COPTS="-O3 -I/usr/include/netpbm -ansi"
    install -D -m755 Unshake "$pkgdir"/usr/bin/unshake-console
    install -D -m644 Unshake.1 "$pkgdir"/usr/share/man/man1/Unshake.1
    #install license
    install -D -m644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-unshake-console
  fi

  #install license
  install -D -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
