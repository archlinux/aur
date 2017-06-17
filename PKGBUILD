# Maintainer: Christian Brendel <cdbrendel@gmail.com>
# Based on [community]'s vim-ultisnips: https://www.archlinux.org/packages/community/any/vim-ultisnips/ 

pkgname=vim-ultisnips-git
pkgver=3.0.r381.g113a901
# Note that it's actually 3.1, but the git repo is mis-tagged
pkgrel=1
pkgdesc='TextMate-style snippets for Vim (git).'
arch=('any')
url='https://github.com/SirVer/ultisnips'
license=('GPL3')
depends=('vim' 'python2')
groups=('vim-plugins')
replaces=('vim-snipmate')
conflicts=('vim-ultisnips')
makedepends=('git')
source=(ultisnips-git::git+https://github.com/SirVer/ultisnips.git
        git+https://github.com/honza/vim-snippets.git)
md5sums=('SKIP'
         'SKIP')

package() {
  cd "${srcdir}/ultisnips-git"

  install -dm755 "$pkgdir/usr/share/vim/vimfiles/"
  cp -r -t "$pkgdir/usr/share/vim/vimfiles/" pythonx after doc ftdetect autoload\
      ftplugin plugin syntax utils

  cd "${srcdir}/vim-snippets"

  install -dm755 "$pkgdir/usr/share/vim/vimfiles/"
  cp -r -t "$pkgdir/usr/share/vim/vimfiles/" UltiSnips autoload snippets

  # compile .pyc and .pyo files (fixes FS#43121)
  find "${pkgdir}" -name '*.py' -exec python2 -mpy_compile {} +
  find "${pkgdir}" -name '*.py' -exec python2 -O -mpy_compile {} +
}

pkgver() {
  cd "ultisnips-git"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
