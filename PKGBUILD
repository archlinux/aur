#Maintainer: archdevlab <https://github.com/archdevlab>

pkgname=valijson-git
pkgdesc='Header-only C++ library for JSON Schema validation (git version)'
pkgver=1.0.2.r8.g27f7e75
pkgrel=1
arch=(any)
url="https://github.com/tristanpenman/valijson"
license=(BSD-2-Clause)
conflicts=(valijson)
provides=(valijson)
makedepends=(git make cmake ninja)
source=('git+https://github.com/tristanpenman/valijson.git')

pkgver(){
  cd "${srcdir}"/valijson
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  rm -rf "${srcdir}"/build

  cmake -B "${srcdir}"/build -S "${srcdir}"/valijson \
  -G "Unix Makefiles" \
  -D CMAKE_BUILD_TYPE=Release \
  -D CMAKE_INSTALL_PREFIX=/usr \
  -D CMAKE_INSTALL_BINDIR=bin \
  -D CMAKE_INSTALL_LIBDIR=lib \
  -D CMAKE_INSTALL_INCLUDEDIR=include \
  -D CMAKE_INSTALL_SYSCONFDIR=/etc \
  -D CMAKE_INSTALL_DATADIR=share \
  -D valijson_BUILD_EXAMPLES=OFF \
  -D valijson_BUILD_TESTS=OFF \
  -D valijson_EXCLUDE_BOOST=OFF \
  -D valijson_USE_EXCEPTIONS=ON \
  -Wno-dev

  make -j$(nproc) -C "${srcdir}"/build
}

package(){
  make -j$(nproc) -C "${srcdir}"/build DESTDIR="${pkgdir}" install

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/valijson/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
