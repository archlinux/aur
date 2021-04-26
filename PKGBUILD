# Maintainer: Alex Kashirin <kashirin.alex@gmail.com>

_group_name="swcdb"
_sub_name="pam-max-retries"

pkgname=${_group_name}-${_sub_name}
pkgver=0.5.0
pkgrel=1
pkgdesc="The SWC-DB PAM Max Retries auth Library"
arch=("x86_64")

groups=($_group_name)
provides=(
  pam_swcdb_max_retries.so
)

url="https://www.swcdb.org"
license=('GPLv3')


depends=(
  'swcdb-lib-thrift-c'
)
makedepends=(
  'git'
  'pkg-config'
  'cmake'
  'make'
  'gcc'
  'swcdb-lib-thrift-c'
)

optdepends=()
conflicts=()
replaces=()
backup=()
options=()
install=README.md
changelog=


source=(
  $pkgname-$pkgver-source::git+https://github.com/kashirin-alex/swc-db.git#tag=v$pkgver
)
sha256sums=('SKIP')



build() {
  mkdir -p $pkgname-$pkgver-build;
  cd $pkgname-$pkgver-build;

  cmake ../$pkgname-$pkgver-source \
    -DO_LEVEL=3 -DSWC_BUILD_PKG=${_sub_name} \
    -DGLIB_INCLUDE_PATH="$(pkg-config --cflags glib-2.0 | tr ' ' ';' | sed 's/-I//g' )" \
    -DCMAKE_SKIP_RPATH=ON -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
    -DCMAKE_BUILD_TYPE=Release;
  make -j$((`grep -c processor < /proc/cpuinfo || echo 1`));
}


package() {
  cd $pkgname-$pkgver-build;
  make install;

  mkdir -p $pkgdir/usr/lib/pam.d;
  mv $pkgdir/usr/lib/libpam_swcdb_max_retries.so \
     $pkgdir/usr/lib/pam.d/pam_swcdb_max_retries.so;
}
