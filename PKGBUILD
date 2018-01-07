# Maintainer: Iván Ruvalcaba <mario.i.ruvalcaba[at]gmail[dot]com>
# Contributor: Ian Ker-Seymer <i.kerseymer@gmail.com>

pkgname=neovim-qt
pkgver=0.2.8
pkgrel=1
pkgdesc="A Qt5 GUI for Neovim"
arch=('i686' 'x86_64')
url="https://github.com/equalsraf/neovim-qt"
license=('ISC')
depends=('neovim' 'qt5-base' 'msgpack-c' 'libxkbcommon-x11')
makedepends=('cmake')
provides=('neovim-qt')
conflicts=('neovim-qt-git')
source=("https://github.com/equalsraf/neovim-qt/archive/v${pkgver}.tar.gz")
sha256sums=('53653c21de1dd41fb78a65f27e989b3478c74ad91cbde92f831fb3d81b25802b')
install=neovim-qt.install

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}"
  cd build
  cmake .. \
    -G 'Unix Makefiles' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_SYSTEM_MSGPACK=ON
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  # Install any plugins packaged with nvim-qt
  cd ../src/gui/runtime

  find . -type f -regex ".*\.\(vim\|txt\)" \
    -exec install -Dm644 {} ${pkgdir}/usr/share/nvim/runtime/{} \;

  cd -

  # Install the binaries and libs
  install -D -m755 bin/nvim-qt \
      "${pkgdir}/usr/bin/nvim-qt"
  install -D -m644 lib/libneovim-qt.a \
      "${pkgdir}/usr/lib/libneovim-qt.a"

  # Install the custom license
  install -Dm644 ../LICENSE \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install desktop files
  install -Dm644 ../src/gui/nvim-qt.desktop \
      "${pkgdir}"/usr/share/applications/nvim-qt.desktop

  # Install icons
  install -Dm644 ../third-party/neovim.png \
      "${pkgdir}"/usr/share/pixmaps/nvim-qt.png
}

# vim:set sw=2 sts=2 et:
