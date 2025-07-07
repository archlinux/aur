# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke at sfu dot ca>
pkgname=ncbi-toolkit
pkgver=29.2.0
pkgrel=1
pkgdesc="Applications, scripts and C++ libraries for the analysis of biological data"
arch=('x86_64')
url="https://github.com/ncbi/ncbi-cxx-toolkit-public"
license=('custom')
depends=('python' 'pcre' 'sqlite' 'lzo' 'libtiff' 'giflib' 'libxpm'
         'mariadb-libs' 'libpng' 'gnutls' 'libxml2' 'libxslt')
optdepends=('fltk' 'wxgtk' 'fcgi')
makedepends=('autoconf' 'cpio')
provides=('blast+-bin')
conflicts=('blast+-bin')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/release/$pkgver.tar.gz
        LICENSE)
sha256sums=('4bb2701b2cc8b4b29b5cde10088142d3c71c0ffd59e5f3402a1a6eec3d07db7e'
            '78bbf3f310ff43f1b5f711e7221d51da1e6f055831bd6c6941e0650bf1261df2')

build() {
  # https://ncbi.github.io/cxx-toolkit/pages/ch_config#ch_config.UNIX
  FLAGS="\
    --without-debug \
    --with-bin-release \
    --with-dll \
    --without-static \
    --with-optimization \
    --with-autodep \
    --with-64 \
    --with-mt \
    --prefix=/usr \
    --with-build-root=$srcdir/build \
    --without-bdb \
    --without-internal \
    --without-boost" # current version in repo not compatible

  cd ncbi-cxx-toolkit-public-release-$pkgver
#  rm -f "$srcdir"/build/inc/ncbiconf_unix.h # in case of previous build
  ./configure $FLAGS
  make
}

package() {
  cd ncbi-cxx-toolkit-public-release-$pkgver
  make prefix="$pkgdir"/usr libdir="$pkgdir"/usr/lib install
  find "$pkgdir"/usr/bin -name "*test*" -delete
}
