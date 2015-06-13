# -*- shell-script -*-
# Maintainer: Alastair Pharo  asppsa at gmail dot com
# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=pure-hg
pkgver=5592.c229999c496e
pkgrel=1
pkgdesc="Pure is a modern-style functional programming language based on term rewriting."
arch=("i686" "x86_64")
license=('GPL3' 'LGPL3')
url="http://purelang.bitbucket.org/"
depends=('llvm35' 'gmp' 'mpfr' 'readline')
makedepends=('mercurial')
optdepends=("pure-docs-hg: online documentation"
            "pcre: Perl regex support"
            "w3m: access to help in interactive mode"
            "emacs-pure-mode: editing Pure files from Emacs"
            "texmacs-pure: embedding Pure sessions in TeXmacs")
provides=('pure')
conflicts=('pure')
source=("hg+https://bitbucket.org/purelang/pure-lang")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pure-lang
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd $srcdir/pure-lang/pure
  autoreconf
  # For Perl5 regex support, at present you still need to add --with-pcre
  # below (and make sure that you have pcre installed). This may become the
  # default in the future.
  ./configure --enable-release --prefix=/usr --without-elisp --without-texmacs
  make || return 1
  make check || return 1
}

package() {
  cd "$srcdir/pure-lang/pure"
  make DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:
