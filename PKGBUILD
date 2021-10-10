# Maintainer: lsf

pkgname=opensnitch-ebpf-module-git
_pkgname=opensnitch
pkgver=1.4.0.r20.9ef64da
pkgrel=1
_kver=5.14
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
            '2a39f9827954e4f991ea52c50e919b6fcc6e7301c046a8ab5029e397f3af982e')

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
