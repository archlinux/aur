# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Iván Ruvalcaba <mario.i.ruvalcaba[at]gmail[dot]com>
# Contributor: Ian Ker-Seymer <i.kerseymer@gmail.com>

pkgname=neovim-qt
pkgver=0.2.10
pkgrel=1
pkgdesc="A Qt5 GUI for Neovim."
arch=('i686' 'x86_64')
url="https://github.com/equalsraf/neovim-qt"
license=('ISC')
depends=('neovim' 'qt5-base')
makedepends=('cmake')
conflicts=('neovim-qt-git')
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('42e3205f3fa9924e4970aed8ff28d17d9aefeb394bb40493d37f8a0afba40c34')
install=neovim-qt.install

build() {
  cd "${pkgname}-${pkgver}"
  cmake -H. -Bbuild \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_SYSTEM_MSGPACK=ON

  cmake --build build
}

check() {
  cd "${pkgname}-${pkgver}"
  cmake --build build -- test ARGS="$MAKEFLAGS" # makeflags has -j$nproc
}

package() {
  cd "${pkgname}-${pkgver}"
  cmake --build build -- DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
