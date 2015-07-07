# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pymacs
pkgver=0.25
pkgrel=2
_gitrel=5989046
pkgdesc='Interface between Emacs Lisp and Python.'
arch=('any')
url='http://pymacs.progiciels-bpi.ca/'
license=('GPL2')
depends=('emacs')
makedepends=('python2' 'python2-docutils' 'texlive-core')
conflicts=('emacs-python-mode')
source=($pkgname-$pkgver.tar.gz::https://github.com/pinard/Pymacs/tarball/v0.25)
md5sums=('3573a1fe20a4afabb7c980d2deac2bdf')
install=$pkgname.install

build() {
  cd ${srcdir}/pinard-P${pkgname:1}-${_gitrel}
  make PYTHON=python2 PREFIX=/usr 
  make PYTHON=python2 RST2LATEX=rst2latex2 pymacs.pdf
  emacs -batch -f batch-byte-compile pymacs.el
  python2 ./setup.py build 
}
package() {
  cd ${srcdir}/pinard-P${pkgname:1}-${_gitrel}
  python2 ./setup.py install --prefix=${pkgdir}/usr
  install -d ${pkgdir}/usr/share/emacs/site-lisp
  install -m 644 $pkgname.{el,elc} ${pkgdir}/usr/share/emacs/site-lisp
  install -Dm644 $pkgname.pdf ${pkgdir}/usr/share/doc/$pkgname/$pkgname.pdf
  cp -r contrib ${pkgdir}/usr/share/doc/$pkgname/
}
