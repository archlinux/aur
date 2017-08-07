# Maintainer:  chet <chetgurevitch @ protonmail . com>
# Contributor: Florian Walch <florian+aur @ fwalch . com>
# Contributor: Sven-Hendrik Haase <sh @ lutzhaase . com>
# Contributor: Florian Hahn <flo @ fhahn . com>

pkgname=neovim-git-ninja
pkgver=0.2.0.r660.g2753d61e4
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs'
arch=('i686' 'x86_64')
url='https://neovim.io'
license=('custom:neovim')
depends=('jemalloc' 'libtermkey' 'libuv' 'libvterm' 'luajit' 'msgpack-c' 'unibilium')
makedepends=('cmake' 'git' 'gperf' 'lua51-lpeg' 'lua51-mpack' 'ninja')
optdepends=('python2-neovim: for Python 2 plugin support (see :help provider-python)'
            'python-neovim: for Python 3 plugin support (see :help provider-python)'
            'ruby-neovim: for Ruby plugin support (see :help provider-ruby)'
            'xclip: for clipboard support (or xsel) (see :help provider-clipboard)'
            'xsel: for clipboard support (or xclip) (see :help provider-clipboard)')
source=("${pkgname}::git+https://github.com/neovim/neovim.git")
sha256sums=('SKIP')
install="${pkgname}.install"

provides=("neovim=${pkgver}")
conflicts=('neovim')
options=(!strip)

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  mkdir -p "${pkgname}/build"
  cd "${pkgname}/build"

  rm -rf runtime/doc
  cmake -G 'Ninja' \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  ninja
}

check() {
  cd "${pkgname}/build/bin"
  ./nvim --version
  ./nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
