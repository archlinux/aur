# Maintainer: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=neovim-git
pkgver=0.7.0.r1637.g56df003bfc
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs.'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
depends=('libluv' 'libtermkey' 'libutf8proc' 'libuv' 'libvterm-0.1' 'luajit' 'msgpack-c' 'unibilium' 'tree-sitter')
makedepends=('cmake' 'git' 'lua51-mpack' 'lua51-lpeg')
optdepends=('python2-neovim: for Python 2 plugin support (see :help provider-python)'
            'python-neovim: for Python 3 plugin support (see :help provider-python)'
            'ruby-neovim: for Ruby plugin support (see :help provider-ruby)'
            'xclip: for clipboard support (or xsel) (see :help provider-clipboard)'
            'xsel: for clipboard support (or xclip) (see :help provider-clipboard)'
            'wl-clipboard: for clipboard support on wayland (see :help clipboard)')
source=("${pkgname}.tar.gz::file:///home/p00f/stuff/pkgbuilds/nvim/repo.tar.gz")
sha256sums=('SKIP')
provides=("neovim=${pkgver}" 'vim-plugin-runtime')
conflicts=('neovim')
options=(!strip)

pkgver() {
  cd /home/p00f/stuff/pkgbuilds/nvim/repo
  git describe --abbrev=10 --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -G Ninja \
        -DCMAKE_C_COMPILER=/usr/bin/clang \
        -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=mold"
        # -DCMAKE_C_FLAGS="-march=native -mtune=native"
  cmake --build build
}

check() {
  cd "${srcdir}/build"
  ./bin/nvim --version
  ./bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install

  cd "${srcdir}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 runtime/nvim.desktop "${pkgdir}/usr/share/applications/nvim.desktop"
  install -Dm644 runtime/nvim.png "${pkgdir}/usr/share/pixmaps/nvim.png"

  # Make Arch vim packages work
  mkdir -p "${pkgdir}"/etc/xdg/nvim
  echo "\" This line makes pacman-installed global Arch Linux vim packages work." > "${pkgdir}"/etc/xdg/nvim/sysinit.vim
  echo "source /usr/share/nvim/archlinux.vim" >> "${pkgdir}"/etc/xdg/nvim/sysinit.vim

  mkdir -p "${pkgdir}"/usr/share/vim
  echo "set runtimepath+=/usr/share/vim/vimfiles" > "${pkgdir}"/usr/share/nvim/archlinux.vim
}

# vim:set sw=2 sts=2 et:
