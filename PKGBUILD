# Contributor: Mathieu.clabaut <mathieu.clabaut@gmail.com>
# Maintainer: Stefan Husmann  <stefan-husmann@t-online.de>
# Contributor: Dr. Hammer <dr_hammer@safe-mail.net>

pkgname=noweb
pkgver=2_13
pkgrel=1
pkgdesc="A Simple, Extensible Tool for Literate Programming build \
against ICON libs and texlive"
url="https://github.com/nrnrnr/noweb"
depends=('bash')
makedepends=('texlive-core' 'nawk' 'icon')
source=($pkgname-$pkgver.tar.gz::https://github.com/nrnrnr/noweb/archive/v$pkgver.tar.gz)
sha256sums=('7b32657128c8e2cb1114cca55023c58fa46789dcffcbe3dabde2c8a82fe57802')
arch=('i686' 'x86_64')
license=('custom')
options=('!strip')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e 's+BIN=/usr/local/noweb+BIN=\$\(MyDestdir\)/usr/bin+' \
      -e 's+LIB=/usr/local/noweb/lib+LIB=\$\(MyDestdir\)/usr/lib/noweb+' \
      -e 's+LIBSRC=awk+LIBSRC=icon+' \
      -e 's+ICONC=iconc+ICONC=icont+' \
      -e 's+MAN=/usr/local/noweb/man+MAN=\$\(MyDestdir\)/usr/share/man+' \
      -e 's+/usr/local/tex/inputs+\$\(MyDestdir\)/usr/share/texmf/tex/generic/noweb+' \
      -e 's+$(HOME)/www/noweb/FAQ.html+'$srcdir/$pkgname-$pkgver'/src/FAQ.html+' \
      -e 's+mkdir+install -d+' -e 's+> \$\(BIN\)+> \$pkgdir/bin/+' \
      -e 's+ELISP=/dev/null+ELISP=\$\(MyDestdir\)/usr/share/emacs/site-lisp+' src/Makefile
  sed -i -e 's+LIB=/dev/null.*$+LIB=\$\(MyDestdir\)/usr/lib/noweb+' \
    contrib/Makefile
  sed -i -e  's+^WWW=.*$+WWW\$\(MyDestdir\)=/usr/share/noweb/www+' \
      src/xdoc/Makefile
  sed -i '132,133d' src/icon/pdcached.icn
  sed -i '138,139d' src/icon/pdcached.icn
}

build() {
  cd $pkgname-$pkgver/src
  make touch boot
  make all
}

package() {
  cd $pkgname-$pkgver/src
  install -Dm644 COPYRIGHT \
    "$pkgdir"/usr/share/licenses/noweb/COPYRIGHT
  install -d "$pkgdir"/usr/share/texmf/tex/generic
  install -d "$pkgdir"/usr/lib/noweb/
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  make PREFIX=/usr MyDestdir="$pkgdir" install || true 
  find "$pkgdir" -type f -exec sed -i "s+${pkgdir}+/+g" '{}' ';'
}

