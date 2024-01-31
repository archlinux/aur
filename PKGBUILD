# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: éclairevoyant
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>

_pkgname=neovim
pkgname="$_pkgname-git"
pkgver=0.9.0.r3144.g9f15a18fa5
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs'
arch=(i686 x86_64 armv7h armv6h aarch64)
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
depends=(
  'libluv'
  'libtermkey'
  'libuv'
  'libvterm>0.1.4'
  'luajit'
  'msgpack-c'
  'tree-sitter-git'
  'unibilium'
)
makedepends=('cmake' 'git' 'ninja' 'lua51-mpack' 'lua51-lpeg' 'unzip')
optdepends=(
  'python-pynvim: for Python plugin support (see :help python)'
  'xclip: for clipboard support on X11 (or xsel) (see :help clipboard)'
  'xsel: for clipboard support on X11 (or xclip) (see :help clipboard)'
  'wl-clipboard: for clipboard support on wayland (see :help clipboard)'
)
provides=("$_pkgname=${pkgver/\.r*/}" 'vim-plugin-runtime')
conflicts=("$_pkgname")
source=(
  "git+https://github.com/neovim/$_pkgname.git"
  nvimdoc{,.hook}
)
sha512sums=('SKIP'
            '22662462c823de243599cdd3483e46ade4ab59b219e907468d34c18e584fe7477548e357ee2ce56bb098cf54b770b108a3511703dd486f0774a65c84af78f6aa'
            '3c6ee1e4646d09c164a2212f9e4d2f53158ff32911b0972e060a395a8d4685334574a7ede995a81680dcc0750cd3327a78beb7904a4bb326b2399d79a8b12d5e')
b2sums=('SKIP'
        'd31cf81659e238fada8092755eb9be16f77c00a466107eb5770c6c9c32e043c91e6efada7ddb51663716a0e38ffa6e3d0093b3e6833aa961d845c7451a95491e'
        '26588b9da6459393076723bdfb8d2b16fed882070f2326bf7c35cd272dee9c18df603afb1ae2254cd0a59eff68189caf04828ef165d5de42c7a4222267604101')

pkgver() {
  cd "$_pkgname"
  git describe --abbrev=10 --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cmake \
    -Bbuild \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_BUNDLED=OFF \
    -W no-dev
  cmake --build build --verbose
}

check() {
  cd "$_pkgname"
  ./build/bin/nvim --version
  ./build/bin/nvim --headless -u NONE -i NONE +q
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks/" nvimdoc.hook
  install -Dt "$pkgdir/usr/share/libalpm/scripts/" nvimdoc

  cd "$_pkgname"
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 runtime/nvim.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 runtime/nvim.appdata.xml -t "${pkgdir}/usr/share/metainfo/"
  install -Dm644 runtime/nvim.png -t "${pkgdir}/usr/share/pixmaps/"

  # Make Arch Vim packages work
  mkdir -p "${pkgdir}"/etc/xdg/nvim
  echo "\" This line makes pacman-installed global Arch Linux vim packages work." > "${pkgdir}"/etc/xdg/nvim/sysinit.vim
  echo "source /usr/share/nvim/archlinux.vim" >> "${pkgdir}"/etc/xdg/nvim/sysinit.vim

  mkdir -p "${pkgdir}"/usr/share/vim
  echo "set runtimepath+=/usr/share/vim/vimfiles" > "${pkgdir}"/usr/share/nvim/archlinux.vim
}

# vim:set sw=2 sts=2 et:
