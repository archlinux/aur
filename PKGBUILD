# Maintainer: lsf

pkgname=opensnitch-ebpf-module-git
_pkgname=opensnitch
pkgver=1.5.0.r18.6c54c2c
pkgrel=1
_kver=5.16
pkgdesc="eBPF process monitor module for opensnitch"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/evilsocket/opensnitch"
license=('GPL3')
makedepends=('git' 'clang' 'llvm' 'libelf'
             'binutils' 'bc' 'rsync')
depends=('opensnitch')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/evilsocket/opensnitch.git'
        "https://github.com/torvalds/linux/archive/v${_kver}.tar.gz")
sha256sums=('SKIP'
            'd5a4751aada0ecd6bee5dbc961dd056e5f8f87ac86dfed9dae145a85035765d2')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long | sed 's/^v//;s/-rc./rc/;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/linux-${_kver}

  patch tools/lib/bpf/bpf_helpers.h < ${srcdir}/${_pkgname}/ebpf_prog/file.patch
  cp ${srcdir}/${_pkgname}/ebpf_prog/opensnitch.c \
    ${srcdir}/${_pkgname}/ebpf_prog/opensnitch-dns.c \
    ${srcdir}/${_pkgname}/ebpf_prog/Makefile samples/bpf

  yes "" | make oldconfig
  make prepare
}

build() {
  cd ${srcdir}/linux-${_kver}

  make headers_install

  cd samples/bpf
  make
  llvm-strip -g opensnitch.o opensnitch-dns.o
}

package() {
  install -Dm644 "${srcdir}/linux-${_kver}/samples/bpf/opensnitch.o" \
    "${srcdir}/linux-${_kver}/samples/bpf/opensnitch-dns.o" -t \
    "$pkgdir/etc/opensnitchd"
}
