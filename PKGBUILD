# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=wp2latex  
pkgver=3.88
pkgrel=1
pkgdesc="Converts WordPerfect document formats to LaTeX"
url="http://www.penguin.cz/~fojtik/$pkgname/$pkgname.htm"
arch=('i686' 'x86_64')
license=('GPL')
source=("${pkgname%-hg}::hg+https://bitbucket.org/JaFojtik/wp2latex#revision=347")
sha256sums=('SKIP')
depends=('libjpeg' 'gcc-libs' 'libpng')
options=('!strip')

build() {
  cd $pkgname/trunk
  autoconf
  CPPFLAGS+="-fpermissive" ./configure --prefix=/usr
  make x2latex
}

package() {
  cd $pkgname/trunk
  install -Dm755 "${srcdir}"/$pkgname/trunk/bin/linux/$pkgname \
    $pkgdir/usr/bin/$pkgname 
  for _i in cs de
  do
    install -Dm644 \
    "$srcdir"/$pkgname/trunk/doc/locale/${_i}/lc_messages/$pkgname.mo \
      "$pkgdir"/usr/share/locale/${_i}/LC_MESSAGES/$pkgname.mo
  done 
  install -Dm644 "$srcdir"/$pkgname/trunk/doc/$pkgname.1 \
    "$pkgdir"/usr/share/man/man1/$pkgname.1 
  install -d "$pkgdir"/usr/share/$pkgname/doc
  cp -R "$srcdir"/$pkgname/trunk/doc/program.man/* \
    "$pkgdir"/usr/share/$pkgname/doc
  install -d "$pkgdir"/usr/share/texmf/tex/latex/$pkgname
  cp "$srcdir"/$pkgname/trunk/styles.tex/* \
    "$pkgdir"/usr/share/texmf/tex/latex/$pkgname
}
