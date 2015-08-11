# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-committia-git
pkgver=20150529
pkgrel=1
pkgdesc='A Vim plugin for more pleasant editing of Git commit messages'
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url='https://github.com/rhysd/committia.vim'
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/rhysd/committia.vim)
sha256sums=('SKIP')
provides=('vim-committia')
conflicts=('vim-committia')
install=vimdoc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-committia/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +

  # Install licence
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  grep '## License' README.md -A 100 > "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENCE"
}
