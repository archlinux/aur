# Maintainer: muttleyxd <mateusz [at] szychowski.it>
pkgname=fmt7
pkgver=7.1.3
pkgrel=1
pkgdesc='Open-source formatting library for C++'
arch=(x86_64)
url=https://fmt.dev
license=(BSD)
depends=(gcc-libs)
makedepends=(
  cmake
  doxygen
  git
  ninja
  npm
  python-pip
  python-virtualenv
)
_tag=7bdf0628b1276379886c7f6dda2cef2b3b374f0b
source=(git+https://github.com/fmtlib/fmt.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd fmt

  git describe --tags
}

build() {
  cmake -S fmt -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/opt/fmt7 \
    -DCMAKE_INSTALL_LIBDIR=/opt/fmt7/lib \
    -DBUILD_SHARED_LIBS=1
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  install -Dm 644 fmt/LICENSE.rst -t "${pkgdir}"/opt/fmt7/share/licenses/fmt

  cd "${pkgdir}"/opt/fmt7/lib
  mv libfmt.so libfmt7.so
  mv libfmt.so.7 libfmt7.so.7
  mv libfmt.so.7.1.3 libfmt7.so.7.1.3

  mv pkgconfig/fmt.pc pkgconfig/fmt7.pc
  sed -i 's/Name: fmt/Name: fmt7/g' pkgconfig/fmt7.pc
  sed -i 's/-lfmt/-lfmt7/g' pkgconfig/fmt7.pc

  cd "${pkgdir}"
  mkdir -p usr/lib
  mv opt/fmt7/lib/pkgconfig usr/lib/

  mkdir -p etc/ld.so.conf.d
  cp "${srcdir}/../ld.so.conf.d.fmt7.conf" etc/ld.so.conf.d/fmt7.conf
}
