# Maintainer: fft
# Contributor: CyanWoods <i at cyanwoods dot com>

pkgname='spdk'
pkgver=26.09
pkgrel=1
pkgdesc='libraries for high performance storage IO'
arch=('x86_64')
license=('BSD-3-Clause')
url='https://spdk.io/'
depends=('dpdk' 'fuse3' 'isa-l' 'isa-l_crypto' 'libaio' 'liburing')
optdepends=('python' 'python-configshell-fb' 'python-grpcio' 'python-ipaddress' 'python-pyparsing' 'python-yaml') # for spdk-cli and spdk-rpc
makedepends=('patchelf' 'python-jinja' 'python-tabulate' 'python-yaml' 'uv')

source=(
  "https://github.com/spdk/spdk/archive/refs/tags/v${pkgver}.tar.gz"
)

b2sums=(
  'fbf3808c212ec7e83a6cf7f8eb1c27243101d0608619781d51c1e4ace6d2bfd041a98be6629c6719424ba7f33596d7e2a768a8426ddc2cbbabdbe59dfcc5557d'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
 sed -i -e 's/isa-l-crypto/isa-l_crypto/' include/spdk/isa-l-crypto.h
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-dpdk --with-isal=/usr --with-isal-crypto=/usr --with-shared --disable-examples --disable-tests --disable-unit-tests --enable-lto --with-uring --without-uring-zns
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
