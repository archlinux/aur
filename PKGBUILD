pkgname=seastar-git
pkgdesc='High performance server-side application framework'
pkgver=r4026.e67572ef
pkgrel=1
arch=('x86_64')
url='https://github.com/scylladb/seastar'
license=('Apache-2')
depends=('hwloc' 'boost' 'boost-libs' 'hwloc' 'numactl' 'libpciaccess' 'crypto++' 'libxml2' 'xfsprogs' 'gnutls' 'lksctp-tools' 'lz4' 'systemtap' 'libtool' 'yaml-cpp')
makedepends=('git' 'cmake' 'gcc' 'ragel')
source=("git+https://github.com/scylladb/seastar#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/seastar"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd seastar
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. -DSeastar_DEMOES=OFF -DSeastar_DOCS=OFF -DSeastar_TESTING=OFF -DSeastar_APPS=OFF
}

build() {
  cd seastar/build
  make
}

package() {
  cd seastar/build
  make DESTDIR="$pkgdir" install
  cd "$pkgdir" && mv usr/lib64 usr/lib
}
