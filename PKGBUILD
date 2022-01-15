# Maintainer: Mikael Elkiaer <aur@elkiaer.net>

# This file was taken from https://aur.archlinux.org/packages/neovim-nightly-bin/ and modified to use stable instead of nightly
# Thanks to quebin31 for doing all the hard work

_pkgname=neovim
_pkgver=0.6.1
pkgname=neovim-stable-bin
# only to show a version
pkgver=0.6.1
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs - Stable Builds'
arch=('x86_64')
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
provides=("${_pkgname}=${_pkgver}" 'vim-plugin-runtime')
conflicts=("${_pkgname}")
optdepends=('python2-neovim: for Python 2 plugin support, see :help python'
            'python-neovim: for Python 3 plugin support, see :help python'
            'xclip: for clipboard support, see :help clipboard'
            'xsel: for clipboard support, see :help clipboard')

_date="$(date -u +%Y%m%d)"
source=("$_pkgname-$_date.tar.gz::https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz")
sha512sums=(SKIP) 
install=neovim.install

pkgver() {
  cd "${srcdir}/nvim-linux64"
  ./bin/nvim --version | head -1 | awk '{ printf $2 }' | sed 's/-/+/g' | sed 's/v//'
}

check() {
  cd "${srcdir}/nvim-linux64"
  ./bin/nvim --version
  ./bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
  cd "${srcdir}/nvim-linux64"

  mkdir -p "${pkgdir}/usr/bin"
  cp -r lib "${pkgdir}/usr/"
  cp -r share "${pkgdir}/usr/"
  install bin/nvim "${pkgdir}/usr/bin"

  # Make Arch vim packages work
  mkdir -p "${pkgdir}"/etc/xdg/nvim
  echo "\" This line makes pacman-installed global Arch Linux vim packages work." > "${pkgdir}"/etc/xdg/nvim/sysinit.vim
  echo "source /usr/share/nvim/archlinux.vim" >> "${pkgdir}"/etc/xdg/nvim/sysinit.vim

  mkdir -p "${pkgdir}"/usr/share/nvim
  echo "set runtimepath+=/usr/share/vim/vimfiles" > "${pkgdir}"/usr/share/nvim/archlinux.vim
}

# vim:set sw=2 sts=2 et:
