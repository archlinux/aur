# Maintainer: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>

pkgname=neovim-git
pkgver=0.1.3.r158.gba97f73
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs.'
arch=('i686' 'x86_64')
url='https://neovim.io'
license=('custom:neovim')
depends=('jemalloc' 'libtermkey' 'libuv' 'libvterm' 'msgpack-c' 'unibilium')
makedepends=('cmake' 'git' 'luajit' 'lua51-mpack' 'lua51-lpeg')
optdepends=('python2-neovim: for Python 2 plugin support (see :help nvim-python)'
            'python-neovim: for Python 3 plugin support (see :help nvim-python)'
            'xclip: for clipboard support (or xsel) (see :help nvim-clipboard)'
            'xsel: for clipboard support (or xclip) (see :help nvim-clipboard)')
source=("${pkgname}::git+https://github.com/neovim/neovim.git")
sha256sums=('SKIP')
provides=("neovim=${pkgver}")
conflicts=('neovim')
install=neovim-git.install
options=(!strip)

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${pkgname}/build"
  cd "${pkgname}/build"
  cmake -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE=Dev \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_JEMALLOC=ON \
        ..
  make
}

check() {
  cd "${pkgname}/build"
  ./bin/nvim --version
  ./bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
