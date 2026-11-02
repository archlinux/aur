# Maintainer: agony <27015 at riseup dot net>
# Contributor: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=wal2json
pkgver=2.7
pkgrel=1
pkgdesc="Output plugin for logical decoding PostgreSQL WAL's"
arch=('x86_64')
url="https://github.com/eulerto/wal2json"
license=('BSD-3-Clause')
depends=('glibc' 'postgresql')
makedepends=('clang' 'llvm')
install=wal2json.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgname}_${pkgver//./_}.tar.gz")
sha256sums=('e6c12d02dc32e4d610dce33ee52ea85a54e12a563e79c4844508b6c061ff07a1')

build() {
  cd "${pkgname}-${pkgname}_${pkgver//./_}"
  make
}

check() {
  cd "${pkgname}-${pkgname}_${pkgver//./_}"
  local data="${srcdir}/pgdata" run="${srcdir}/pgrun" rc=0
  rm -rf "${data}" "${run}"
  mkdir "${run}"
  initdb -D "${data}" -E UTF8 --no-locale -A trust > /dev/null
  # A local socket only, and the plugin loaded from the build directory
  pg_ctl -D "${data}" -l "${srcdir}/postgres.log" -w start \
    -o "-c listen_addresses='' -k ${run} -c wal_level=logical -c output_plugin_libraries=wal2json -c dynamic_library_path='${PWD}:\$libdir'"
  PGHOST="${run}" make installcheck || rc=$?
  pg_ctl -D "${data}" -m fast stop
  return "${rc}"
}

package() {
  cd "${pkgname}-${pkgname}_${pkgver//./_}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
