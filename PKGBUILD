# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=isoimagewriter
pkgname=$_pkgname-git
pkgver=v0.1.r0.gdd48057
pkgrel=1
pkgdesc="A program to write hybrid ISO files onto a USB disk from Linux, Mac or Windows ready to boot."
arch=("x86_64" "i686")
url="https://community.kde.org/ISOImageWriter"
license=('GPL3')
depends=('ki18n' 'kauth' 'qgpgme')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'python')
source=(git+https://anongit.kde.org/isoimagewriter.git
        fix_build.patch)
sha512sums=('SKIP'
            '6cdb771a4c54f59d6884fa1d43ad4c913c91e86437de9255ec6ed133179d84f8bf44509fa7682ac7b70166e48a1d010371a637ec8756a1e40d631396878d477a')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
  cd $_pkgname
  patch -Np0 < $srcdir/fix_build.patch
}

build() {
  cd build
  cmake ../$_pkgname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
