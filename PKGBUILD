# $Id$
# Maintainer: Pablo Hernandez <pablo.hernandez.cerdan AT outlook.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>

pkgname=ninja-kitware
pkgver=1.13.0
pkgrel=1
pkgdesc='Small build system with a focus on speed - Kitware version with JobServer and Fortran compatibility'
arch=(x86_64)
url='https://github.com/Kitware/ninja'
provides=(ninja)
conflicts=(ninja)
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cmake
  gtest
  python
  re2c
)
version_id=gd74ef
source=(ninja-$pkgver.$version_id.kitware.jobserver-pipe-1.zip::https://github.com/Kitware/ninja/archive/refs/tags/v$pkgver.$version_id.kitware.jobserver-pipe-1.zip)
md5sums=('8ec37dfd4afaeea0a9cb0c4466400a78')

build() {
  cmake -B build -S ninja-$pkgver.$version_id.kitware.jobserver-pipe-1 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  cd ninja-$pkgver.$version_id.kitware.jobserver-pipe-1

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


package() {
  DESTDIR="$pkgdir" cmake --install build
  pkgname_dest="ninja"

  cd ninja-$pkgver.$version_id.kitware.jobserver-pipe-1
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname_dest" doc/manual.asciidoc
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname_dest" COPYING

  install -vDm644 -t "$pkgdir/usr/share/vim/vimfiles/syntax" misc/ninja.vim
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -vDm644 -t "$pkgdir/$site_packages" misc/ninja_syntax.py

  install -vDm644 misc/bash-completion "$pkgdir/usr/share/bash-completion/completions/ninja"
  install -vDm644 misc/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_ninja"
}
