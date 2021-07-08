# Maintainer: lsf

pkgname=opensnitch-ebpf-module-git
_pkgname=opensnitch
pkgver=1.4.0.rc.2.r27.8580281
pkgrel=1
_kver=5.12
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
            '1c9334afe7a3b805d8d5127ee31441418c795242a3ac30789fa391a0bdeb125b')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd ${srcdir}/linux-${_kver}

  patch tools/lib/bpf/bpf_helpers.h < ${srcdir}/${_pkgname}/ebpf_prog/file.patch
  cp ${srcdir}/${_pkgname}/ebpf_prog/opensnitch.c ${srcdir}/${_pkgname}/ebpf_prog/Makefile samples/bpf

  yes "" | make oldconfig
  make prepare
}

build() {
  cd ${srcdir}/linux-${_kver}

  make headers_install

  cd samples/bpf
  make
  llvm-strip -g opensnitch.o
}

package() {
  install -Dm644 "${srcdir}/linux-${_kver}/samples/bpf/opensnitch.o" -t \
    "$pkgdir/etc/opensnitchd"
}
