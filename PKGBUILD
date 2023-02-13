# Maintainer: Rasmus Moorats <xx+aur@nns.ee>

pkgname=opensnitch-ebpf-module
_pkgname=opensnitch
pkgver=1.5.7
pkgrel=1
_kver=6.0.14
pkgdesc="eBPF process monitor module for opensnitch"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/evilsocket/opensnitch"
license=('GPL3')
makedepends=('clang' 'llvm' 'libelf' 'flex'
             'binutils' 'bc' 'rsync')
depends=('opensnitch')
conflicts=("${pkgname}-git" "${pkgname}-stable")
source=("${url}/archive/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v${_kver%%.*}.x/linux-${_kver}.tar.xz")
sha256sums=('d68bf55e4b7cc6a9db6c7eb35412afdabdff988d54c3ead24d5ebb8286f59ca3'
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
