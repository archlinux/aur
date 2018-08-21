# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Iván Ruvalcaba <mario.i.ruvalcaba[at]gmail[dot]com>
# Contributor: Ian Ker-Seymer <i.kerseymer@gmail.com>

pkgname=neovim-qt
pkgver=0.2.9
pkgrel=2
pkgdesc="A Qt5 GUI for Neovim."
arch=('i686' 'x86_64')
url="https://github.com/equalsraf/neovim-qt"
license=('ISC')
depends=('neovim' 'qt5-base')
makedepends=('cmake')
conflicts=('neovim-qt-git')
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('0142a75f39a5fc19a7198673600d2612ef970bf59a02157b3a639a1d58bee008')
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
