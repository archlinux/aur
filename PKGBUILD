# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=xlnt-git
pkgver=1.2.0.r2.g8bd85f9
pkgrel=1
pkgdesc="Cross-platform user-friendly xlsx library for C++11"
url="https://github.com/tfussell/xlnt"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('git' 'cmake>=3.1.0')
conflicts=('xlnt')
provides=('xlnt')
source=('git://github.com/tfussell/xlnt.git')
sha512sums=('SKIP')

pkgver() {
  cd xlnt
  git describe | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  mkdir -p build

  sed -e 's/DengXian Light/\\xe5\\xae\\x8b\\xe4\\xbd\\x93/' -e 's/DengXian/\\xe5\\xae\\x8b\\xe4\\xbd\\x93/' -i  xlnt/source/detail/serialization/xlsx_producer.cpp
}

build() {
  cd build
  cmake ../xlnt \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check() {
  cd build/tests
  ./xlnt.test
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 xlnt/LICENSE.md "${pkgdir}"/usr/share/licenses/xlnt-git/LICENSE.md
}
