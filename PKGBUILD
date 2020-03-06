# Contributor: Tom Richards <tom@tomrichards.net>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Aerion (emile [at] aerion [dot] co [dot] uk
# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>

pkgname=brother-hl2040
pkgver=2.0.1
pkgrel=2
pkgdesc="Brother HL-2040 CUPS driver"
url="http://www.brother.com"
license=('GPL')
install="brother-hl2040.install"
arch=('i686' 'x86_64')
depends=('cups')
depends_x86_64=('lib32-glibc')

source=(brother-hl2040.patch
        brother-hl2040.install
        http://www.brother.com/pub/bsc/linux/dlf/cupswrapperHL2040-$pkgver-1.i386.rpm
        http://www.brother.com/pub/bsc/linux/dlf/brhl2040lpr-$pkgver-1.i386.rpm)
sha256sums=('4a2118ae57baf4a891656ef80dd789ef801875238eaa0b893473e0d8a424681f'
            '81f320491f4cdab592c25b075bea3ba84690c6ae0fa1746c5f865765901827f5'
            'cff424e97b46c1de23b31a1a23f2edc5b78e5682bdc71222a39098b531c519f6'
            'e123fe7030148c2842fa1859ccd89bd613c31fb7ec9c536032e42a1e0adeaece')

build() {
  cd "$srcdir/usr"
  patch -p1 -i "$srcdir/$pkgname.patch"

  cd "$srcdir"
  "$srcdir/usr/local/Brother/cupswrapper/cupswrapperHL2040-$pkgver"
}

package() {
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/usr/bin" "$pkgdir/usr"
  cp -R "$srcdir/usr/lib" "$pkgdir/usr"
  cp -R "$srcdir/usr/local/Brother" "$pkgdir/usr/share/brother"

  rm "$pkgdir/usr/share/brother/cupswrapper/cupswrapperHL2040-$pkgver"
  rm "$pkgdir/usr/share/brother/inf/setupPrintcap"

  install -Dm644 ppd_file "$pkgdir/usr/share/cups/model/HL2040.ppd"
  install -Dm755 wrapper "$pkgdir/usr/lib/cups/filter/brlpdwrapperHL2040"
}
