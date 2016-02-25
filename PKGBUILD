# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname=vim-vital-git
pkgver=20160214
pkgrel=1
pkgdesc="Comprehensive Vim utility functions for Vim plugins"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/vim-jp/vital.vim"
license=('NYSL')
source=(${pkgname%-git}::git+https://github.com/vim-jp/vital.vim)
sha256sums=('SKIP')
provides=('vim-vital')
conflicts=('vim-vital')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-vital/README.md"
  install -Dm 644 Changes "$pkgdir/usr/share/doc/vim-vital/Changes"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload doc plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
