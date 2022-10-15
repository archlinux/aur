# Maintainer: Francesco La Camera <fm@lacamera.org>
pkgname=nvim-nightly
pkgver=0.9.0.dev.1c47839
pkgrel=1
pkgdesc='hyperextensible Vim-based text editor'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/neovim/neovim/releases/tag/nightly'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
depends=('libluv' 'libtermkey' 'libuv' 'libvterm' 'luajit' 'msgpack-c' 'tree-sitter' 'unibilium')
makedepends=('cmake' 'gperf' 'ninja' 'lua51-mpack' 'lua51-lpeg' 'patchelf')
optdepends=('python2-neovim: Python 2 provider'
            'python-pynvim: Python 3 provider'
            'ruby-neovim: Ruby provider'
            'xclip: X11 clipboard integration'
            'xsel: X11 clipboard integration'
            'wl-clipboard: wayland clipboard integration')
source=("$pkgname-$pkgver::https://github.com/neovim/neovim/archive/refs/tags/nightly.tar.gz")
provides=("neovim=$pkgver" 'vim-plugin-runtime')
conflicts=('neovim')
sha256sums=('SKIP')

build() {
  cmake -Sneovim-nightly -Bbuild \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  cd "$srcdir/build"
  ./bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
  cd "$srcdir/build"
  DESTDIR="$pkgdir" cmake --build . --target install
  cd "$srcdir/neovim-nightly"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 runtime/nvim.desktop "$pkgdir/usr/share/applications/nvim.desktop"
  install -Dm644 runtime/nvim.png "$pkgdir/usr/share/pixmaps/nvim.png"
  mkdir -p "$pkgdir/etc/xdg/nvim"
  mkdir -p "$pkgdir/usr/share/vim"
  echo "source /usr/share/nvim/archlinux.vim" >> "$pkgdir"/etc/xdg/nvim/sysinit.vim
  echo "set runtimepath+=/usr/share/vim/vimfiles" > "$pkgdir"/usr/share/nvim/archlinux.vim
}
