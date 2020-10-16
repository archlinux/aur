# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=bibtool-git
pkgver=2.68.r14.g43de68a
pkgrel=1
pkgdesc="Command line manipulation of BibTeX files - from git-repo"
arch=('i686' 'x86_64')
url="http://www.gerd-neugebauer.de/software/TeX/BibTool/"
license=('GPL')
depends=('texlive-bin' 'glibc')
makedepends=('git' 'texlive-core')
provides=('bibtool')
conflicts=('bibtool')
source=("git+https://github.com/ge-ne/bibtool")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | cut -c9- | tr _ . | sed 's+-+.r+' | tr - .
}

build() {
  cd ${pkgname%-git}
  autoreconf
  ./configure --prefix=/usr
  make
  cd doc
  make
}

package() {
  cd ${pkgname%-git}
  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/docs/$pkgname "$pkgdir"/usr/share/man/man1
  make INSTALLPREFIX="$pkgdir/" install
  cd doc
  for _i in *.pdf
  do
    install -Dm644 ${_i} "$pkgdir"/usr/share/docs/$pkgname/${_i}
  done
  install -Dm644 ${pkgname%-git}.1 "$pkgdir"/usr/share/man/man1
}
