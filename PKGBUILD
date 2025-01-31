# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-recover-git
pkgver=r203.c84f072
pkgrel=2
pkgdesc='A Vim plugin to show a diff, whenever recovering a buffer'
arch=('any')
url='http://www.vim.org/scripts/script.php?script_id=3068'
license=('custom') # see `:h license` in vim
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('python: for using cvim')
makedepends=('git')
provides=('vim-recover')
conflicts=('vim-recover')
source=('git+https://github.com/chrisbra/Recover.vim.git'
        'fix_nomenclature.patch')
sha256sums=('SKIP'
            '67f2652b757065f927ee4b09135e6e0de6cc5903a2d3ccd1db2fe3bd63ca807a')

pkgver() {
  cd 'Recover.vim'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd 'Recover.vim'
  # rename "on-disk version" to something more precise https://github.com/chrisbra/Recover.vim/issues/47
  patch -p0 <"$srcdir/fix_nomenclature.patch"
}

package() {
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r Recover.vim/{autoload,contrib,doc,plugin} "${_installpath}"

  _licencepath="${pkgdir}/usr/share/licenses/$pkgname/"
  mkdir -p "${_licencepath}"
  sed -n '/^Copyright/,/^$/p' Recover.vim/doc/recoverPlugin.txt | sed '$d' > "${_licencepath}/LICENSE"
}
