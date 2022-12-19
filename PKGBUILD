# Maintainer: Tom Locke <xx@nns.ee>

pkgname=opensnitch-ebpf-module-stable
_pkgname=opensnitch
pkgver=1.5.2
pkgrel=9
_kver=6.0.14
pkgdesc="eBPF process monitor module for opensnitch"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/evilsocket/opensnitch"
license=('GPL3')
makedepends=('clang' 'llvm' 'libelf' 'flex'
             'binutils' 'bc' 'rsync')
depends=('opensnitch')
provides=("${pkgname%-stable}")
conflicts=("${pkgname%-stable}" "${pkgname%-stable}-git")
source=("${url}/archive/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v${_kver%%.*}.x/linux-${_kver}.tar.xz")
sha256sums=('8aa9cb07dfed2881240c5d3a359668cc3d19060fe8f2819c73cd265abd62b2c6'
            '5ef18f7e7fcffa2571431fccb3bc26a4e975492208e8490867148a2a5b78c220')
options=('!strip') # we're stripping with llvm-strip

prepare() {
  cd ${srcdir}/linux-${_kver}

  patch tools/lib/bpf/bpf_helpers.h < ${srcdir}/${_pkgname}-${pkgver}/ebpf_prog/file.patch
  cp ${srcdir}/${_pkgname}-${pkgver}/ebpf_prog/opensnitch*.c \
    ${srcdir}/${_pkgname}-${pkgver}/ebpf_prog/Makefile samples/bpf

  yes "" | make oldconfig
  make prepare
}

build() {
  cd ${srcdir}/linux-${_kver}

  make headers_install

  cd samples/bpf
  make
  llvm-strip -g opensnitch*.o
}

package() {
  install -Dm644 "${srcdir}/linux-${_kver}/samples/bpf/opensnitch"*".o" -t \
    "$pkgdir/etc/opensnitchd"
}
