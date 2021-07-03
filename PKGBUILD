# Maintainer: Speykious <speykious@gmail.com>

pkgname=neovim-bin
pkgver=`cat current_version`
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs - Latest Stable Release.'
arch=('x86_64')
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
provides=("neovim=$pkgver" 'vim-plugin-runtime')
conflicts=('neovim' 'neovim-git' 'neovim-nightly-bin')
optdepends=('python2-neovim: for Python 2 plugin support, see :help python'
            'python-neovim: for Python 3 plugin support, see :help python'
            'xclip: for clipboard support, see :help clipboard'
            'xsel: for clipboard support, see :help clipboard')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/neovim/neovim/releases/download/v$pkgver/nvim-linux64.tar.gz")
sha512sums=(`cat nvim_sha512sum`)
install=neovim.install

check() {
  cd "$srcdir/nvim-linux64"
  ./bin/nvim --version
  ./bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
  cd "$srcdir/nvim-linux64"

  mkdir -p "$pkgdir/usr/bin"
  cp -r lib "$pkgdir/usr/"
  cp -r share "$pkgdir/usr/"
  install bin/nvim "$pkgdir/usr/bin"

  # Make Arch vim packages work
  mkdir -p "$pkgdir/etc/xdg/nvim"
  echo '" This line makes pacman-installed global Arch Linux vim packages work.' > "$pkgdir/etc/xdg/nvim/sysinit.vim"
  echo 'source /usr/share/nvim/archlinux.vim' >> "$pkgdir/etc/xdg/nvim/sysinit.vim"

  mkdir -p "$pkgdir/usr/share/nvim"
  echo 'set runtimepath+=/usr/share/vim/vimfiles' > "$pkgdir/usr/share/nvim/archlinux.vim"
}

# vim:set sw=2 sts=2 et:
