# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=wp2latex  
pkgver=3.69
pkgrel=1
pkgdesc="Converts WordPerfect document formats to LaTeX"
url="http://www.penguin.cz/~fojtik/$pkgname/$pkgname.htm"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://www.penguin.cz/~fojtik/$pkgname/$pkgname-${pkgver}.zip)
md5sums=('64df707f38ddce5d78589ceb797c1d82')
depends=('libjpeg' 'gcc-libs')
makedepends=('unzip')
install=$pkgname.install
noextract=("$pkgname-${pkgver}.zip")
options=('!strip')

build() {
  # hack to avoid the dos line ends in all sourcefiles.
  cd ${srcdir}
  unzip -quo -aa $srcdir/$pkgname-${pkgver}.zip
  find $srcdir/$pkgname.${pkgver} -type d -exec chmod 770 {} \;
  # normal build
  cd ${srcdir}/$pkgname.${pkgver}
  autoconf
  CPPFLAGS+="-fpermissive" CXX=g++ ./configure --prefix=/usr --without-png
  make x2latex
}

package() {
  cd ${srcdir}/$pkgname.${pkgver}
  install -Dm755 ${srcdir}/$pkgname.${pkgver}/linux/$pkgname \
    $pkgdir/usr/bin/$pkgname 
  for _i in cs de
  do
    install -Dm644 \
    $srcdir/$pkgname.${pkgver}/doc/locale/${_i}/lc_messages/$pkgname.mo \
      $pkgdir/usr/share/locale/${_i}/LC_MESSAGES/$pkgname.mo
  done 
  install -Dm644 $srcdir/$pkgname.${pkgver}/doc/$pkgname.1 \
    $pkgdir/usr/share/man/man1/$pkgname.1 
  install -d $pkgdir/usr/share/$pkgname/doc
  cp -R $srcdir/$pkgname.${pkgver}/doc/program.man/* \
    $pkgdir/usr/share/$pkgname/doc
  install -d $pkgdir/usr/share/texmf/tex/latex/$pkgname
  cp $srcdir/$pkgname.${pkgver}/styles.tex/* \
    $pkgdir/usr/share/texmf/tex/latex/$pkgname
}
