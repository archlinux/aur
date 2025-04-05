# Maintainer: fft
# Contributor: CyanWoods <i at cyanwoods dot com>

pkgname='spdk'
pkgver=24.09
pkgrel=1
pkgdesc='libraries for high performance storage IO'
arch=('x86_64')
license=('BSD-3-Clause')
url='https://spdk.io/'
conflicts=('isa-l_crypto') # TODO: bundled version is used now. Switch to using AUR package after it will be upgraded
depends=('dpdk' 'fuse3' 'isa-l' 'libaio' 'liburing')
optdepends=('python-configshell-fb' 'python-grpcio' 'python-ipaddress' 'python-pyparsing') # for spdk-cli and spdk-rpc
makedepends=('patchelf')

source=(
  "https://github.com/spdk/spdk/archive/refs/tags/v${pkgver}.tar.gz"
  'https://github.com/intel/isa-l_crypto/archive/refs/tags/v2.25.0.tar.gz'
  'p1.patch'
  'p2.patch'
)

b2sums=(
  '516ec08fd63a299d6f79dca96cffe967c3ba894993ef1521832c79225c88c69f758ecfb4b5462fa30c272e46b86262abbaae241df630d59d2435239733891e83'
  '18328b404a2686718fc8cf9bc596816e4521ec85440e8aad2bb40d32eabc606807617fc08c2790c4bb0a0b84648fa9820a4a6c19ac6a3cbbbc2cd96bddfd1eb9'
  '74fe7f254268766b8b38020e0efbaeb6d3585d03980517d3a5a8d8a0bccc3691dd0acea8807a2e9a913fa3c7957330cc25278da23f1c54a357da2787796e31c4'
  '80ed9a3e7f8644b78ea754ca6768c0521a9e4998dbef2e2a2a5dce43b6d4792c62ebe852d7fbe4fba85867c00200e5278f539a37601aeda656041a04a58ae5ca'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -r ../isa-l_crypto-2.25.0/* './isa-l-crypto/'
  sed -i 's/isa-l\/include/isa-l/' lib/util/crc16.c lib/util/crc64.c lib/util/crc_internal.h lib/util/xor.c
  sed -i 's/\.\.\/isa-l\/include/isa-l/' lib/accel/accel_sw.c
  sed -i 's/rte_power\.h/rte_power_cpufreq\.h/' module/scheduler/dpdk_governor/dpdk_governor.c # TMP until updating to DPDK v25. See https://github.com/DPDK/dpdk/commit/f30a1bbd63f494f5ba623582d7e9166c817794a4
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
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
