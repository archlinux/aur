# Maintainer: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>

pkgname=neovim
pkgver=0.1.0
pkgrel=2
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs.'
arch=('i686' 'x86_64')
url='https://neovim.io'
license=('custom:neovim')
depends=('jemalloc' 'libtermkey' 'libuv' 'msgpack-c' 'unibilium')
makedepends=('cmake' 'luajit' 'lua51-messagepack' 'lua51-lpeg')
optdepends=('python2-neovim: for Python 2 plugin support (see :help nvim-python)'
            'python-neovim: for Python 3 plugin support (see :help nvim-python)'
            'xclip: for clipboard support (or xsel) (see :help nvim-clipboard)'
            'xsel: for clipboard support (or xclip) (see :help nvim-clipboard)')
_libvterm_commit=1b745d29d45623aa8d22a7b9288c7b0e331c7088
source=("https://github.com/neovim/neovim/archive/v${pkgver}.tar.gz"
        "https://github.com/neovim/libvterm/archive/${_libvterm_commit}.tar.gz")
sha256sums=('e8659558103b8f5a65aac84007a12e3581b32736321778028017fd07365cfff8'
            '3fc75908256c0d158d6c2a32d39f34e86bfd26364f5404b7d9c03bb70cdc3611')
install=neovim.install

build() {
  # Build and link libvterm statically. As libvterm's API is still very much in flux,
  # depending on the 'libvterm-bzr' package would eventually break this package's build
  # until a new Neovim release supports the new libvterm API. A separate 'libvterm-neovim'
  # package would conflict with packages that will eventually require a libvterm with a
  # newer API, e.g. 'pangoterm-bzr'. This workaround will not be required anymore once
  # there is a release of libvterm.
  # Suggestions on how to solve this in a better way are welcome!
  cd "${srcdir}/libvterm-${_libvterm_commit}"
  make PREFIX=/usr DESTDIR="${srcdir}/libvterm-install" install

  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIBVTERM_USE_STATIC=ON \
        -DDEPS_PREFIX="${srcdir}/libvterm-install/usr" \
        -DENABLE_JEMALLOC=ON \
        "../neovim-${pkgver}"
  make
}

check() {
  cd "${srcdir}/build"
  ./bin/nvim --version
  ./bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/neovim-${pkgver}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
