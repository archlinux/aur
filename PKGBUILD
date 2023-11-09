# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke at sfu dot ca>
pkgname=ncbi-toolkit
pkgver=27.0.0
pkgrel=1
pkgdesc="Applications, scripts and C++ libraries for the analysis of biological data"
arch=('i686' 'x86_64')
url="https://github.com/ncbi/ncbi-cxx-toolkit-public"
license=('custom')
depends=('python' 'pcre' 'sqlite' 'lzo' 'libtiff' 'giflib' 'libxpm'
         'mariadb-libs' 'libpng' 'gnutls' 'libxml2' 'libxslt')
optdepends=('fltk' 'wxgtk' 'fcgi')
makedepends=('autoconf' 'cpio')
provides=('blast+-bin')
conflicts=('blast+-bin')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/release-$pkgver.tar.gz)
sha256sums=('c8fb3f99c6fce4f170b381f3a7789c76a2ff1c23c094c9852e2e3de1fdc57277')

prepare() {
  sed -i "39i#include <cstdint>" ncbi-cxx-toolkit-public-release-27.0.0/include/util/impl/compile_time_bits.hpp
}

build() {
  # https://ncbi.github.io/cxx-toolkit/pages/ch_config#ch_config.UNIX
  FLAGS="\
    --without-debug \
    --with-bin-release \
    --with-dll \
    --without-static \
    --with-optimization \
    --with-autodep \
    --with-mt \
    --prefix=/usr \
    --with-build-root=$srcdir/build
    --without-bdb \
    --without-internal \
    --without-boost" # current version in repo not compatible

  if [ $CARCH = "x86_64" ]; then
    FLAGS="$FLAGS --with-64"
  fi

  cd "ncbi-cxx-toolkit-public-release-$pkgver"
#  rm -f "$srcdir"/build/inc/ncbiconf_unix.h # in case of previous build
  ./configure $FLAGS
  make
}

package() {
  cd "ncbi-cxx-toolkit-public-release-$pkgver"
  make prefix="$pkgdir"/usr libdir="$pkgdir"/usr/lib install
  find "$pkgdir"/usr/bin -name "*test*" -delete
}
