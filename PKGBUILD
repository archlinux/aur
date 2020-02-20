# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jove-git
pkgver=132.20200218
pkgrel=1
pkgdesc=" Emacs-like editor without Lisp from github"
url="https://github.com/jonmacs/jove/"
license=('custom')
arch=('i686' 'x86_64')
depends=('termcap' 'glibc')
provides=('jove')
conflicts=('jove')
source=("git+$url#branch=moraes")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.%s" $(git rev-list --count HEAD) \
	 $(git log -1 --format="%cd" --date=short | tr -d '-')
}

build() {
  cd ${pkgname%-git}
  make SYSDEFS="-DSYSVR4 -D_XOPEN_SOURCE=500" \
  JOVEHOME=/usr SHARDIR=/usr/share/jove TMPDIR=/var/tmp \
  RECDIR=/var/tmp/jove.preserve DFLTSHELL=/bin/bash
}

package() {
  cd ${pkgname%-git}
  install -d "$pkgdir"/usr/{bin,lib/jove,share/{jove,man/man1}}
  make JOVEHOME="$pkgdir"/usr install
  for _f in "$pkgdir"/usr/man/man1/jove.1  "$pkgdir"/usr/man/man1/teachjove.1
  do
    install -Dm644 ${_f} "$pkgdir"/usr/share/man/man1/${_f}
  done
  rm -rf "$pkgdir"/usr/man/
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
