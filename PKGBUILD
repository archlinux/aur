# Maintainer: Aerion (emile [at] aerion [dot] co [dot] uk
# Contributor: Jaroslaw Rosiek <jaroslaw.rosiek@interia.pl>

pkgname="brother-hl2030"
pkgver="2.0.1"
pkgrel="6"
pkgdesc="Brother HL-2030 CUPS driver"
url="http://www.brother.com"
license=('GPL')
install="brother-hl2030.install"
arch=('i686' 'x86_64')
depends_x86_64=('lib32-glibc') 
md5sums=('e81a2b369368fb8fa56a08c3341097b2'
         '29e4d9dfd44ee8fc1629b9cfdadfb896'
         '29d20e3925e29779260dbbcd0d1fc29e')

source=(
  brother-hl2030.patch \
  http://download.brother.com/welcome/dlf005837/cupswrapperHL2030-2.0.1-1.i386.rpm
  http://download.brother.com/welcome/dlf005835/brhl2030lpr-2.0.1-1.i386.rpm
)

prepare() {
  cd "$srcdir/usr/" || return 1
  patch -p1 < ../brother-hl2030.patch

  cd "$srcdir" || return 1
  "$srcdir/usr/local/Brother/cupswrapper/cupswrapperHL2030-2.0.1"
}

package() {
  mkdir -p "$pkgdir/usr/share"
  cp -R "$srcdir/usr/bin" "$pkgdir/usr"
  cp -R "$srcdir/usr/lib" "$pkgdir/usr"
  cp -R "$srcdir/usr/local/Brother" "$pkgdir/usr/share/brother"

  rm "$pkgdir/usr/share/brother/cupswrapper/cupswrapperHL2030-2.0.1"
  rm "$pkgdir/usr/share/brother/inf/setupPrintcap"

  install -m 644 -D ppd_file "$pkgdir/usr/share/cups/model/HL2030.ppd"
  install -m 755 -D wrapper "$pkgdir/usr/lib/cups/filter/brlpdwrapperHL2030"
}
