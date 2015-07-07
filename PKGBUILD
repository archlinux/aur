# See AUR interface to contact current maintainer.

pkgname=uemacs-git
pkgver=20141208.r122
pkgrel=1
pkgdesc="Micro-emacs version customized by Linus Torvalds"
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=editors/uemacs/uemacs.git;a=summary"
license=('custom')
depends=('ncurses')
makedepends=('git')
source=("$pkgname::git://git.kernel.org/pub/scm/editors/uemacs/uemacs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.r%s" \
    "$(git log -1 --format="%cd" --date=short | sed 's/\-//g')" \
    "$(git rev-list --count HEAD)"
    #"$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  # Have uemacs look for its helpfile in a proper location.
  sed -i -e "s#\"/usr/global/lib/\"#\"/usr/share/"$pkgname"/\"#" \
       epath.h

  # Fix Makefile
  sed -i -e "s#^\(CFLAGS\)=-O2\(.\+\)#\1+=\2#" \
         -e "s#\(BINDIR=\)\(/usr/bin\)#\1"$pkgdir"\2#" \
         -e "s#\(LIBDIR=\)/usr/lib#\1"$pkgdir"/usr/share/"$pkgname"#" \
      Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package () {
  cd "$srcdir/$pkgname"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/"$pkgname"
  mkdir -p "$pkgdir"/usr/share/doc/"$pkgname"
  mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"

  make install
  install -m644 "$srcdir/$pkgname"/README "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir/$pkgname"/readme.39e "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir/$pkgname"/emacs.ps "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir/$pkgname"/emacs.rc "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir/$pkgname"/UTF-8-demo.txt "$pkgdir"/usr/share/doc/"$pkgname"
  install -m644 "$srcdir/$pkgname"/README "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  gzip -9N "$pkgdir"/usr/share/doc/"$pkgname"/{README,readme.39e,emacs.ps,emacs.rc,UTF-8-demo.txt}
}
