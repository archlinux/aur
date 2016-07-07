# -*- shell-script -*-
# Maintainer: Alastair Pharo  asppsa at gmail dot com
# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=pure-git
pkgver=r5648.758494c
pkgrel=1
pkgdesc="Pure is a modern-style functional programming language based on term rewriting."
arch=("i686" "x86_64")
license=('GPL3' 'LGPL3')
url="http://purelang.bitbucket.org/"
depends=('llvm35-libs' 'gmp' 'mpfr' 'readline')
makedepends=('git' 'llvm35')
optdepends=("clang35: needed for inlining C/C++ code"
	    "pure-docs-git: online documentation"
            "pcre: Perl regex support"
            "w3m: access to help in interactive mode"
            "emacs-pure-mode: editing Pure files from Emacs"
            "texmacs-pure: embedding Pure sessions in TeXmacs")
provides=('pure')
conflicts=('pure')
replaces=('pure-hg')
source=("git+https://bitbucket.org/purelang/pure-lang")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pure-lang
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
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
  # Copy the needed binaries from the LLVM toolchain to make the batch
  # compiler work without having the llvm35 package installed.
  cp /usr/bin/llc /usr/bin/llvm-as /usr/bin/opt $pkgdir/usr/lib/pure
}

# vim:set ts=2 sw=2 et:
