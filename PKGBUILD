# Maintainer: Whyme Lyu <callme5long@gmail.com>
#
# CREDITS: most of the code was copied from aur/neovim-git
#
# The followings are contributors of neovim-git:
# Contributor: A Farzat <a@farzat.xyz>
# Contributor: éclairevoyant
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>
# Contributor: Gregory Anders <aur@gpanders.com>

_pkgname=neovim
pkgname=neovim-later
# commit is chosen kinda arbitarily. But I'd make sure to pick one
# with all the CI checks passed.
_commit=c2e0fd1c35c22b4c53f903fb46fe9005926b1e16
# Make sure pkgver is less than .0 official release and neovim-git
# e.g:
# `vercmp 0.12.0 0.12.0.xlater.2512' must return 1
# `vercmp 0.12.0.r1585.g70ea589d79-1 0.12.0.xlater.2512' must return 1
pkgver=0.12.0.xlater.2512
# Unfortunately I don't know how to pkgver or _commit into `nvim -v`
pkgrel=1
pkgdesc='Following Neovim dev branch at least monthly'
arch=(i686 x86_64 armv7h armv6h aarch64)
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
depends=(
  'libluv'
  'libutf8proc'
  'libuv'
  'lua51-lpeg'
  'luajit'
  'msgpack-c'
  'tree-sitter-c'
  'tree-sitter-lua'
  'tree-sitter-markdown'
  'tree-sitter-query'
  'tree-sitter-vimdoc'
  'tree-sitter-vim'
  'tree-sitter>=0.22.2'
  'unibilium'
)
makedepends=('cmake' 'ninja' 'unzip')
optdepends=(
  'python-pynvim: for Python plugin support (see :help python)'
  'tree-sitter-bash: tree-sitter parser for bash'
  'tree-sitter-python: tree-sitter parser for python'
  'xclip: for clipboard support on X11 (or xsel) (see :help clipboard)'
  'xsel: for clipboard support on X11 (or xclip) (see :help clipboard)'
  'wl-clipboard: for clipboard support on wayland (see :help clipboard)'
)
provides=("neovim" 'vim-plugin-runtime')
conflicts=("neovim")
source=(
  "https://github.com/neovim/neovim/archive/$_commit.zip"
  nvimdoc{,.hook}
)
b2sums=('0c923a55704a4144cd335cd92d4c572c292c04e03235fbeda1f5cfb547b7660d73c06210064670c3ab5ad80e7dec828355c69924e30af771d399b1aa4065e03a'
        'd31cf81659e238fada8092755eb9be16f77c00a466107eb5770c6c9c32e043c91e6efada7ddb51663716a0e38ffa6e3d0093b3e6833aa961d845c7451a95491e'
        '26588b9da6459393076723bdfb8d2b16fed882070f2326bf7c35cd272dee9c18df603afb1ae2254cd0a59eff68189caf04828ef165d5de42c7a4222267604101')

build() {
  cd "$_pkgname-$_commit"

  # Use bundled utf8proc until upstream pins back to a stable release
  cmake -S cmake.deps -B .deps -G Ninja -DUSE_BUNDLED=OFF -DUSE_BUNDLED_UTF8PROC=ON
  cmake --build .deps

  cmake \
    -Bbuild \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja \
    -W no-dev
  cmake --build build
}

check() {
  cd "$_pkgname-$_commit"
  ./build/bin/nvim --version
  ./build/bin/nvim --headless -u NONE -i NONE +q
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks/" nvimdoc.hook
  install -Dt "$pkgdir/usr/share/libalpm/scripts/" nvimdoc

  cd "$_pkgname-$_commit"
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -Dm644 runtime/nvim.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 runtime/nvim.appdata.xml -t "${pkgdir}/usr/share/metainfo/"
  install -Dm644 runtime/nvim.png -t "${pkgdir}/usr/share/pixmaps/"

  # Make Arch Vim packages work
  mkdir -p "${pkgdir}"/etc/xdg/nvim
  echo "\" This line makes pacman-installed global Arch Linux vim packages work." > "${pkgdir}"/etc/xdg/nvim/sysinit.vim
  echo "source /usr/share/nvim/archlinux.vim" >> "${pkgdir}"/etc/xdg/nvim/sysinit.vim

  mkdir -p "${pkgdir}"/usr/share/vim
  echo "set runtimepath+=/usr/share/vim/vimfiles" > "${pkgdir}"/usr/share/nvim/archlinux.vim

  ln -s /usr/lib/tree_sitter "${pkgdir}"/usr/lib/nvim/parser
}

# vim:set sw=2 sts=2 et:
