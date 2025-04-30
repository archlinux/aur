# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgbase=rbutil-git
pkgname=('rbutil-git')
pkgver=4.0.final.120.g6a8f1a7e84
pkgrel=1
arch=('x86_64')
url='https://www.rockbox.org/twiki/bin/view/Main/RockboxUtility'
license=('GPL-2.0-or-later')
depends=(
  gcc-libs
  glibc
  libbz2.so
  libusb-1.0.so
  qt5-base
  qt5-multimedia
  qt5-svg
  zlib
)
makedepends=(
  cmake
  git
  ninja
  qt5-tools
)
optdepends=('speex: voice files support')
source=('git+https://git.rockbox.org/cgit/rockbox.git'
        'rbutil.desktop')
sha256sums=('SKIP'
            '6c7e7f8aa3dbbf1ace8cd43dd057649cfd329224e899fb83d739113a8a15be9d')

pkgver() {
  cd rockbox

  git describe --tags | sed 's/rbutil_//' | sed 's:-:.:g'
}

prepare() {
  sed '/add_subdirectory(themeeditor)/d' -i rockbox/utils/CMakeLists.txt
}

build() {

  cmake -S rockbox/utils -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package(){
  install -Dm 755 build/rbutilqt/RockboxUtility -t "${pkgdir}"/usr/bin/
  install -Dm 644 rockbox/utils/rbutilqt/RockboxUtility.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 rockbox/docs/logo/rockbox-clef.svg -t "${pkgdir}"/usr/share/pixmaps/
}

# vim: ts=2 sw=2 et:
