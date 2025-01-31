# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-committia-git
pkgver=r134.1d28828
pkgrel=2
epoch=1
pkgdesc='A Vim plugin for more pleasant editing of Git commit messages'
arch=('any')
depends=('vim-plugin-runtime')
makedepends=('git')
groups=('vim-plugins')
url='https://github.com/rhysd/committia.vim'
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/rhysd/committia.vim)
sha256sums=('SKIP')
provides=('vim-committia')
conflicts=('vim-committia')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname%-git}

  # Installing documentation
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-committia/README.md"

  # Installing appdirs
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in autoload plugin; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  # Cleaning up pkgdir
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +

  # Install licence
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
