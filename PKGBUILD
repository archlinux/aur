# Maintainer: fft
# Contributor: CyanWoods <i at cyanwoods dot com>

pkgname='spdk'
pkgver=26.01
pkgrel=1
pkgdesc='libraries for high performance storage IO'
arch=('x86_64')
license=('BSD-3-Clause')
url='https://spdk.io/'
depends=('dpdk' 'fuse3' 'isa-l' 'isa-l_crypto' 'libaio' 'liburing')
optdepends=('python' 'python-configshell-fb' 'python-grpcio' 'python-ipaddress' 'python-pyparsing') # for spdk-cli and spdk-rpc
makedepends=('patchelf' 'uv')

source=(
  "https://github.com/spdk/spdk/archive/refs/tags/v${pkgver}.tar.gz"
  'p1.patch'
  'p2.patch'
  'https://github.com/spdk/spdk/commit/74adbd3694789216d4b0d1cd3093fe731dbd697b.patch'
)

b2sums=(
  '4ca1b0aa4b5266a43cd8bb180130340e7a61b0604a8e60c6f240f7e3ecf96ddda0862975f4623a260ed828a552bff2f685be248f6b9502c62f34f7047f7d88b1'
  '2f028ec51894b5b53fd98a1d6f0aca7853906ec03c5cc0b49672551d66597450875f793965718bcef6a6ef95cd69661e6530d4c470b5adae29ab3274094692db'
  '5387487e1dbaf90e7c1297e6fee35b29c2c57f2c4e5f4ca521dec1ba86e822813971c468ff3f27fa1df4b407575faf88d3d5540b300da5faf54ffe45f50022c6'
  'd8d225aa7c63fb61869eafa7a5fde99170b2fb2ea461033d970b12075ef3214b6e775123f82a243d60f7f3f440a986d22ea4a1f0d0a5305fca1afcb1cd5201be'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/isa-l\/include/isa-l/' lib/util/crc16.c lib/util/crc64.c lib/util/crc_internal.h lib/util/xor.c
  sed -i -e 's/\.\.\/isa-l\/include/isa-l/' -e 's/\.\.\/isa-l-crypto\/include\///' lib/accel/accel_sw.c
  patch configure ../../p1.patch
  patch Makefile ../../p2.patch
  patch python/Makefile ../../74adbd3694789216d4b0d1cd3093fe731dbd697b.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #TODO: use --with-isal and --with-isal-crypto after https://github.com/spdk/spdk/commit/d71508452944747976da6f0326973cb5c3d59bdb will be released
  ./configure --prefix=/usr --with-dpdk --with-shared --disable-examples --disable-tests --disable-unit-tests --enable-lto --with-uring --without-uring-zns
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
