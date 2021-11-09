# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: Richard Murri <admin@richardmurri.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pymacs-git
pkgver=0.26.r32.g9deea58
pkgrel=1
pkgdesc='Interface between Emacs Lisp and Python.'
arch=('any')
url='https://github.com/dgentry/Pymacs'
license=('GPL2')
depends=('emacs' 'python')
makedepends=('python' 'python-docutils')
conflicts=('emacs-python-mode' 'pymacs')
provides=('pymacs')
source=(git+$url.git)
sha256sums=('SKIP')
install=${pkgname%-git}.install

pkgver() {
  cd Pymacs
  git describe --tags | sed 's+-+.r+' | tr - . | cut -c2-
}  

build() {
  cd Pymacs
  make PREFIX=/usr 
  emacs -batch -f batch-byte-compile pymacs.el
  python ./setup.py build 
}

package() {
  cd Pymacs
  python ./setup.py install --prefix="$pkgdir"/usr
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install -m 644 *.{el,elc} "$pkgdir"/usr/share/emacs/site-lisp
}
