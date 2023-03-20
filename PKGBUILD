# $Id$
# Maintainer: Pablo Hernandez <pablo.hernandez.cerdan AT outlook.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>

pkgname=ninja-kitware
pkgver=1.11.1
pkgrel=1
pkgdesc='Small build system with a focus on speed - Kitware version with JobServer and Fortran compatibility'
arch=(x86_64)
url='https://github.com/Kitware/ninja'
provides=(ninja)
conflicts=(ninja)
license=(Apache)
depends=(gcc-libs)
makedepends=(python re2c)
optdepends=(emacs)
version_id=g95dee
source=(ninja-$pkgver.$version_id.kitware.jobserver-1.zip::https://github.com/Kitware/ninja/archive/v$pkgver.$version_id.kitware.jobserver-1.zip)
md5sums=('b37780056cefbe124f3f14c623fbc529')
build() {
  cd ninja-$pkgver.$version_id.kitware.jobserver-1

  python configure.py --bootstrap
  if [ -x "$(command -v emacs)" ]; then
    emacs -Q --batch -f batch-byte-compile misc/ninja-mode.el
  fi
}

check() {
  cd ninja-$pkgver.$version_id.kitware.jobserver-1

  python ./configure.py
  ./ninja ninja_test
  ./ninja_test --gtest_filter=-SubprocessTest.SetWithLots
}

package() {
  cd ninja-$pkgver.$version_id.kitware.jobserver-1

  install -m755 -D ninja "$pkgdir/usr/bin/ninja"
  install -m644 -D doc/manual.asciidoc "$pkgdir/usr/share/doc/ninja/manual.asciidoc"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/ninja/COPYING"

  if [ -x "$(command -v emacs)" ]; then
    install -m644 -D misc/ninja-mode.el "$pkgdir/usr/share/emacs/site-lisp/ninja-mode.el"
    install -m644 -D misc/ninja-mode.elc "$pkgdir/usr/share/emacs/site-lisp/ninja-mode.elc"
  fi
  install -m644 -D misc/ninja.vim "$pkgdir/usr/share/vim/vimfiles/syntax/ninja.vim"

  install -m644 -D misc/bash-completion "$pkgdir/usr/share/bash-completion/completions/ninja"
  install -m644 -D misc/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_ninja"
}
