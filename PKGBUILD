# Maintainer: lsf

pkgname=opensnitch-ebpf-module-git
_pkgname=opensnitch
pkgver=1.4.0.r3.c66d5d6
pkgrel=1
_kver=5.13
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
            '9ce4c15b10d4dc9e353f3105dd11b9d2d2ef83e24772d68d3cf0830fe5f527a1')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long | sed 's/^v//;s/rc\.[0-9]*-//;s/\([^-]*-\)g/r\1/;s/-/./g'
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
