# Maintainer:  Emanuel Schmidt <emanuel.schmidt@gmail.com>

pkgname=xdp-tools
pkgver=1.2.3
pkgrel=1
pkgdesc='Utilities for use with XDP and libxdp'
depends=('libelf' 'linux-api-headers' 'libbpf')
url='https://github.com/xdp-project/xdp-tools'
license=('custom')
makedepends=('git' 'gcc' 'make' 'm4' 'pkgconfig' 'libpcap' 'zlib')
arch=('x86_64')
source=("git+https://github.com/xdp-project/xdp-tools#tag=v${pkgver}")
sha256sums=('SKIP')

prepare () {
  cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"
  export PRODUCTION=1
  export DYNAMIC_LIBXDP=1
  export FORCE_SYSTEM_LIBBPF=1
  export PREFIX="/usr"
  ./configure  ## `--prefix` doesn't work yet (https://github.com/xdp-project/xdp-tools/issues/133)
  make V=1
}

package() {
  cd "${srcdir}/${pkgname}"
  export DESTDIR="${pkgdir}"
  export SBINDIR="/usr/bin"
  export PREFIX="/usr"
  make install V=1
  pushd "${pkgdir}/usr"
  rm -r share/xdp-tools ## Do not package examples or tests (https://github.com/xdp-project/xdp-tools/issues/134)
  rm -r lib/bpf/ ## These object-files should not be packaged
  popd
}
