# Maintainer: lsf

pkgname=opensnitch-ebpf-module-git
_pkgname=opensnitch
pkgver=1.6.0rc5.r84.e1afd24
pkgrel=2
pkgdesc="eBPF process monitor module for opensnitch"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/evilsocket/opensnitch"
license=('GPL3')
makedepends=('git' 'clang' 'llvm' 'libelf'
             'bc' 'rsync' 'linux-headers' 'coreutils')
depends=('opensnitch')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/evilsocket/opensnitch.git'
        '0001-Build-with-Archlinux.patch')
sha256sums=('SKIP'
            '446c029de1cbd39308575e346511d80ee160d2dea575d64fddc7835fc3040460')
options=('!strip') # we're stripping with llvm-strip

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/^v//;s/-rc./rc/;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}/ebpf_prog"

  patch Makefile < "${srcdir}/0001-Build-with-Archlinux.patch"
}

build() {
  cd "${srcdir}/${_pkgname}/ebpf_prog"

  KERNEL_DIR="/usr/lib/modules/$(uname -r)/build" KERNEL_HEADERS="${KERNEL_DIR}" ARCH="${arch}" make all
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/ebpf_prog/opensnitch.o" \
    "${srcdir}/${_pkgname}/ebpf_prog/opensnitch-procs.o" \
    "${srcdir}/${_pkgname}/ebpf_prog/opensnitch-dns.o" -t \
    "${pkgdir}/usr/lib/opensnitchd/ebpf/"
}
