# Maintainer: Masanori Ogino <masanori.ogino@gmail.com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=nuweb
pkgver=1.62
pkgrel=1
epoch=
pkgdesc="A Simple Literate Programming Tool"
arch=('i686' 'x86_64')
url="http://nuweb.sourceforge.net/"
license=('custom:BSD-3-Clause')
depends=('texlive-core')
install=nuweb.install
source=("http://downloads.sourceforge.net/project/nuweb/$pkgname-$pkgver.tar.gz" "nuweb.install" "nuweb.LICENSE")
sha256sums=('255a8f62460f5c14f4c4b356b96e0357a37a6652ae0584064f8e9fae19e953ae'
            '93b550ff61543e6628a858cb28d70c7a850da8aa4fbfc7172830eae70fc78014'
            '86d9ee75add7cee2e21c0423182523e9525b2f5824dbf802fea3e337d0a49e77')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  latexmk -pdf nuwebdoc

  make nuweb

  ./nuweb nuweb.w
  ./nuweb nuwebsty.w

  latexmk -pdf nuweb
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cp nuweb.LICENSE "$srcdir/$pkgname-$pkgver/LICENSE"
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/{emacs/site-lisp,texmf/tex/latex,doc/$pkgname,licenses/$pkgname,man/man1}

  install -D -m755 $srcdir/$pkgname-$pkgver/nuweb        $pkgdir/usr/bin/nuweb
  install -D -m644 $srcdir/$pkgname-$pkgver/nuweb.1      $pkgdir/usr/share/man/man1/nuweb.1
  install -D -m644 $srcdir/$pkgname-$pkgver/nuweb.el     $pkgdir/usr/share/emacs/site-lisp/nuweb.el
  install -D -m644 $srcdir/$pkgname-$pkgver/README       $pkgdir/usr/share/doc/$pkgname/README
  install -D -m644 $srcdir/$pkgname-$pkgver/LICENSE      $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -D -m644 $srcdir/$pkgname-$pkgver/bibnames.sty $pkgdir/usr/share/texmf/tex/latex/$pkgname/bibnames.sty
  install -D -m644 $srcdir/$pkgname-$pkgver/html.sty     $pkgdir/usr/share/texmf/tex/latex/$pkgname/html.sty
  install -D -m644 $srcdir/$pkgname-$pkgver/nwhren.sty   $pkgdir/usr/share/texmf/tex/latex/$pkgname/nwhren.sty
  install -D -m644 $srcdir/$pkgname-$pkgver/nwhres.sty   $pkgdir/usr/share/texmf/tex/latex/$pkgname/nwhres.sty

  install -D -m644 $srcdir/$pkgname-$pkgver/nuweb.pdf    $pkgdir/usr/share/doc/$pkgname/nuweb.pdf
  install -D -m644 $srcdir/$pkgname-$pkgver/nuwebdoc.pdf $pkgdir/usr/share/doc/$pkgname/nuwebdoc.pdf
}
