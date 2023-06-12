# Maintainer: Rasmus Moorats <xx+aur@nns.ee>

pkgname=opensnitch-ebpf-module
_pkgname=opensnitch
pkgver=1.5.9
pkgrel=2
pkgdesc="eBPF process monitor module for opensnitch"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/evilsocket/opensnitch"
license=('GPL3')
makedepends=('bc' 'clang' 'libelf' 'linux-headers' 'llvm')
depends=('opensnitch')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('881bc1e00a26559e87e76310a874647b3b2221e6ad25844d90cdc70223ca086a')
options=('!strip') # we're stripping with llvm-strip

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/ebpf_prog"
  KDIR="/usr/src/linux"

  # we set -fno-stack-protector here to work around a clang regression
  # this is fine - bpf programs do not use stack protectors
  CLANG="clang -fno-stack-protector" ARCH="$CARCH" KERNEL_DIR="$KDIR" KERNEL_HEADERS="$KDIR" make
  llvm-strip -g opensnitch*.o
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/ebpf_prog/opensnitch"*".o" -t \
    "${pkgdir}/usr/lib/opensnitchd/ebpf"
}
