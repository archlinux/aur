# Maintainer: fft
# Contributor: CyanWoods <i at cyanwoods dot com>

pkgname='spdk'
pkgver=25.09
pkgrel=2
pkgdesc='libraries for high performance storage IO'
arch=('x86_64')
license=('BSD-3-Clause')
url='https://spdk.io/'
depends=('dpdk' 'fuse3' 'isa-l' 'isa-l_crypto' 'libaio' 'liburing')
optdepends=('python-configshell-fb' 'python-grpcio' 'python-ipaddress' 'python-pyparsing') # for spdk-cli and spdk-rpc
makedepends=('patchelf')

source=(
  "https://github.com/spdk/spdk/archive/refs/tags/v${pkgver}.tar.gz"
  'p1.patch'
  'p2.patch'
)

b2sums=(
  '69bdd05abb49ec795683262bb6520b25296e9bc4ea05be40abd991cab525ce8453db1fef8fbc4d128fd41cc1ecd2288a8adf5891f5df1636b535b7f751a48867'
  '2f028ec51894b5b53fd98a1d6f0aca7853906ec03c5cc0b49672551d66597450875f793965718bcef6a6ef95cd69661e6530d4c470b5adae29ab3274094692db'
  '5387487e1dbaf90e7c1297e6fee35b29c2c57f2c4e5f4ca521dec1ba86e822813971c468ff3f27fa1df4b407575faf88d3d5540b300da5faf54ffe45f50022c6'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/isa-l\/include/isa-l/' lib/util/crc16.c lib/util/crc64.c lib/util/crc_internal.h lib/util/xor.c
  sed -i -e 's/\.\.\/isa-l\/include/isa-l/' -e 's/\.\.\/isa-l-crypto\/include/isa-l_crypto/' lib/accel/accel_sw.c
  patch configure ../../p1.patch
  patch Makefile ../../p2.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-dpdk --disable-examples --disable-tests --disable-unit-tests --enable-lto --with-uring --without-uring-zns
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" make install
  find "${pkgdir}/usr/lib" -name *.so -exec patchelf --remove-rpath {} \;

  # self-contained /usr/bin/spdk-setup
  echo '#!/usr/bin/env bash' > "${pkgdir}/usr/bin/spdk-setup"
  cat scripts/{common,setup}.sh >> "${pkgdir}/usr/bin/spdk-setup"
  sed -ri '/^rootdir/d;/^source/d;s,\$rootdir,/usr,' "${pkgdir}/usr/bin/spdk-setup"
  chmod +x "${pkgdir}/usr/bin/spdk-setup"

  install -Dm644 'scripts/bash-completion/spdk' "${pkgdir}/usr/share/bash-completion/completions/spdk"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" 'LICENSE'
}
