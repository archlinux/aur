# Maintainer: Konstantin Gizdov <kgizdov at archlinux dot org>
# Contributor:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Adam Ehlers Nyholm Thomsen<adament@adament.net>

pkgname=davix
pkgver=0.8.4
_pkgver="R_${pkgver//./_}"
pkgrel=2
pkgdesc="A client for data and file management over the WebDav, Amazon S3, Microsoft Azure and HTTP protocols."
arch=('x86_64')
url="https://github.com/cern-fts/davix"
license=('LGPL2.1')
depends=('openssl' 'libxml2' 'util-linux-libs')
makedepends=('doxygen' 'boost' 'cmake' 'git' 'python')
checkdepends=('gtest')
source=(
  "${pkgname}::git+https://github.com/cern-fts/davix.git#tag=${_pkgver}"
  "${pkgname}-curl::git+https://github.com/curl/curl"
  "${pkgname}-googletest::git+https://github.com/google/googletest"
)
b2sums=('SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init

  git config submodule."deps/curl".url "${srcdir}/${pkgname}"-curl
  git config submodule."deps/googletest".url "${srcdir}/${pkgname}"-googletest
  git -c protocol.file.allow=always submodule update --init --recursive

  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}"/build

  CFLAGS="${CFLAGS}" \
  CXXFLAGS="${CXXFLAGS}" \
  LDFLAGS="${LDFLAGS}" \
  cmake -DLIB_SUFFIX="" \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    "${srcdir}/${pkgname}"

  make
  make doc
}

check() {
  cd "${srcdir}/${pkgname}"/build
  make test
}

package() {
  cd "${srcdir}/${pkgname}"/build
  make DESTDIR="${pkgdir}/" install
}
