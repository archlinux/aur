# Maintainer: Eklektisk <eklektisk@eklektiskiscoding.xyz>
# Neovim PKGBUILD Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

_pkgbasever=0.5.0
pkgname=nvim-with-restricted-mode
pkgver=0.5.0.r1.af6ee44
pkgrel=1
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
source=("https://github.com/neovim/neovim/archive/v${_pkgbasever}/${pkgname}-${_pkgbasever}.tar.gz" "https://raw.githubusercontent.com/Eklektisk/nvim-restricted-mode-patch/master/restore_restricted_mode.patch")
sha512sums=('f6649f804faabb4104d3b28283932e40358c23990961f4ca7b380089318da312e59242746cee06387f4d881dd6514abbfec79c4063482383adfb4106e9e7a3a4' 'SKIP')

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
