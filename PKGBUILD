# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=xlnt-git
pkgver=1.5.0.r176.g297b3314
pkgrel=1
pkgdesc="Cross-platform user-friendly xlsx library for C++11"
url="https://github.com/tfussell/xlnt"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('git' 'cmake>=3.1.0')
conflicts=('xlnt')
provides=('xlnt')
source=('git+https://github.com/tfussell/xlnt.git'
        'git+https://git.codesynthesis.com/libstudxml/libstudxml.git')
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd xlnt
  git describe | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd xlnt
  git submodule init
  git config submodule.libstudxml.git.url $srcdir/libstudxml
  git submodule update

  cd ../
  mkdir -p build

  sed -e 's/DengXian Light/\\xe5\\xae\\x8b\\xe4\\xbd\\x93/' -e 's/DengXian/\\xe5\\xae\\x8b\\xe4\\xbd\\x93/' -i  xlnt/source/detail/serialization/xlsx_producer.cpp
  sed -i "1i #include <cstdint>" "xlnt/include/xlnt/cell/phonetic_run.hpp"
  sed -i "1i #include <cstdint>" "xlnt/source/utils/time.cpp"
  sed -i "1i #include <cstdint>" "xlnt/source/utils/timedelta.cpp"
  sed -i "1i #include <cstdint>" "xlnt/source/utils/variant.cpp"
}

build() {
  cd build
  cmake ../xlnt \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 xlnt/LICENSE.md "${pkgdir}"/usr/share/licenses/xlnt-git/LICENSE.md
}
