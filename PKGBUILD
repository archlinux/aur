# Maintainer: la Fleur <lafleur at boum dot org>

pkgname=vim-mesonic-git
pkgver=r52.f480c87
pkgrel=1
pkgdesc="Support for meson build system in vim"
arch=('i686' 'x86_64')
url="https://github.com/igankevich/mesonic"
license=('unknown')
depends=('vim')
optdepends=('vim-syntastic')
makedepends=('git')
provides=('vim-mesonic')
conflicts=('vim-mesonic')
groups=('vim-plugins')
source=("$pkgname"::'git://github.com/igankevich/mesonic' "mesonic-ftdetect.vim")
md5sums=('SKIP' '96ad7cc96c944ce67a6efc8bb83ae991')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}"

  # The meson package alreday pulls ftdetect, indent and syntax meson.vim files
  # in _installpath vimfiles, so we'll workaround the package name. We'll use
  # our compiler/meson.vim though.

  cd "$srcdir"
  install -D -m644 mesonic-ftdetect.vim "${_installpath}/ftdetect/mesonic.vim"

  cd "$pkgname"
  for part in compiler ftdetect ftplugin indent plugin syntax doc
  do
      install -D -m644 ${part}/meson.vim "${_installpath}/${part}/mesonic.vim"
  done
  #cp -r -t "${_installpath}" doc syntax_checkers
  cp -r -t "${_installpath}" compiler
  msg "The doc is available in vim at ':help mesonic'."
}

