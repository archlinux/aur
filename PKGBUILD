# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Aerion (emile [at] aerion [dot] co [dot] uk
# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>

pkgname=brother-hl2040
pkgver=2.0.1
pkgrel=1
pkgdesc="Brother HL-2040 CUPS driver"
url="http://www.brother.com"
license=('GPL')
install="brother-hl2040.install"
arch=('i686' 'x86_64')
depends_x86_64=('lib32-glibc') 

source=(brother-hl2040.patch
        brother-hl2040.install
        http://download.brother.com/welcome/dlf005842/cupswrapperHL2040-$pkgver-1.i386.rpm
        http://download.brother.com/welcome/dlf005840/brhl2040lpr-$pkgver-1.i386.rpm)
md5sums=('c162975d1764145bf3a73befdb4f5df3'
         '5400480b3988184f2a675a8a29e82baf'
         '82f57a91f1d4f2d51d37758a0c6a2673'
         '72930935ddb2ed7ba49fe1f5b4479e16')

prepare() {
  cd "$srcdir/usr/" || return 1
  patch -p1 < ../brother-hl2040.patch

  cd "$srcdir" || return 1
  "$srcdir/usr/local/Brother/cupswrapper/cupswrapperHL2040-$pkgver"
}

package() {
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/usr/bin" "$pkgdir/usr"
  cp -R "$srcdir/usr/lib" "$pkgdir/usr"
  cp -R "$srcdir/usr/local/Brother" "$pkgdir/usr/share/brother"

  rm "$pkgdir/usr/share/brother/cupswrapper/cupswrapperHL2040-$pkgver"
  rm "$pkgdir/usr/share/brother/inf/setupPrintcap"

  install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/HL2040.ppd"
  install -m 755 -D wrapper "$pkgdir/usr/lib/cups/filter/brlpdwrapperHL2040"
}
