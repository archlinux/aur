# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=wp2latex  
pkgver=3.91
pkgrel=2
pkgdesc="Converts WordPerfect document formats to LaTeX"
url="http://www.penguin.cz/~fojtik/$pkgname/$pkgname.htm"
arch=('i686' 'x86_64')
license=('GPL')
source=("http://www.penguin.cz/~fojtik/$pkgname/$pkgname-$pkgver.zip")
sha256sums=('968a6720eeaff958ee4a6e1603a36fdceb82946b76732fadab91ee27d64c4900')
depends=('libjpeg' 'gcc-libs' 'libpng')
options=('!strip')

build() {
  cd $pkgname-$pkgver
  autoconf
  CPPFLAGS+="-fpermissive" ./configure --prefix=/usr
  make x2latex
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 "${srcdir}"/$pkgname-$pkgver/bin/linux/$pkgname \
    $pkgdir/usr/bin/$pkgname 
  for _i in cs de
  do
    install -Dm644 \
    "$srcdir"/$pkgname-$pkgver/doc/locale/${_i}/lc_messages/$pkgname.mo \
      "$pkgdir"/usr/share/locale/${_i}/LC_MESSAGES/$pkgname.mo
  done 
  install -Dm644 "$srcdir"/$pkgname-$pkgver/doc/$pkgname.1 \
    "$pkgdir"/usr/share/man/man1/$pkgname.1 
  install -d "$pkgdir"/usr/share/$pkgname/doc
  cp -R "$srcdir"/$pkgname-$pkgver/doc/program.man/* \
    "$pkgdir"/usr/share/$pkgname/doc
  install -d "$pkgdir"/usr/share/texmf/tex/latex/$pkgname
  cp "$srcdir"/$pkgname-$pkgver/styles.tex/* \
    "$pkgdir"/usr/share/texmf/tex/latex/$pkgname
}
