# Maintainer: Eklektisk <eklektisk@eklektiskiscoding.xyz>
# Neovim PKGBUILD Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

_pkgbasever=0.5.1
pkgname=nvim-with-restricted-mode
pkgver=0.5.1.r2.af6ee44
pkgrel=2
pkgdesc="Neovim with restricted mode patch"
arch=('x86_64')
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
provides=('neovim' 'vim-plugin-runtime')
conflicts=('neovim' 'neovim-git')
depends=('libtermkey' 'libuv' 'msgpack-c' 'unibilium' 'libvterm' 'luajit' 'libluv' 'tree-sitter')
makedepends=('cmake' 'ninja' 'lua51-mpack' 'lua51-lpeg' 'gperf')
optdepends=('python-neovim: for Python 3 plugin support (see :help python)'
            'xclip: for clipboard support on X11 (or xsel) (see :help clipboard)'
            'xsel: for clipboard support on X11 (or xclip) (see :help clipboard)'
            'wl-clipboard: for clipboard support on wayland (see :help clipboard)')
source=("https://github.com/neovim/neovim/archive/v${_pkgbasever}/${pkgname}-${_pkgbasever}.tar.gz" "restore_restricted_mode.patch")
sha512sums=('a5a976c4998e821e0d9a9038d3f0c9e7c424a951f6bfc6d75898916d6a004ac668f31a34c3472fc4fca6b1d9652ac662b06780dd04dc6a77ecdc81564ec05709' 'SKIP')

build() {
  cd neovim-${_pkgbasever}
  patch -p1 < ../restore_restricted_mode.patch
  cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_BUNDLED=OFF
  ninja -C build
}

check() {
  cd neovim-${_pkgbasever}/build
  ./bin/nvim --version
  ./bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
  cd neovim-${_pkgbasever}
  DESTDIR="${pkgdir}" ninja -C build install

  cd "${srcdir}/neovim-${_pkgbasever}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 runtime/nvim.desktop "${pkgdir}/usr/share/applications/nvim.desktop"
  install -Dm644 runtime/nvim.appdata.xml "${pkgdir}/usr/share/metainfo/nvim.appdata.xml"
  install -Dm644 runtime/nvim.png "${pkgdir}/usr/share/pixmaps/nvim.png"

  # Make Arch vim packages work
  mkdir -p "${pkgdir}"/etc/xdg/nvim
  echo "\" This line makes pacman-installed global Arch Linux vim packages work." > "${pkgdir}"/etc/xdg/nvim/sysinit.vim
  echo "source /usr/share/nvim/archlinux.vim" >> "${pkgdir}"/etc/xdg/nvim/sysinit.vim

  mkdir -p "${pkgdir}"/usr/share/vim
  echo "set runtimepath+=/usr/share/vim/vimfiles" > "${pkgdir}"/usr/share/nvim/archlinux.vim
}

# vim:set sw=2 sts=2 et:
