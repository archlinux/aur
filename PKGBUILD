# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
# Contributor: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
pkgname=bpftrace-git
_pkgname=bpftrace
pkgver=r4397.19ab9e3d
pkgrel=1
pkgdesc='High-level tracing language for Linux eBPF'
arch=('i686' 'x86_64')
url="https://github.com/bpftrace/bpftrace"
license=('Apache-2.0')
# As of 2025-09-03, libbpf-git is required to get a static linked version.
# The main repo libbpf only provides a dynamic library, which isn't enough.
depends=('glibc' 'gcc-libs' 'libelf' 'zlib' 'llvm-libs' 'clang' 'bcc' 'libbpf-git' 'libpcap' 'zstd')
makedepends=('binutils' 'cmake' 'llvm' 'git' 'linux-headers' 'ninja' 'gtest' 'cereal'
             'asciidoctor' 'xxd')
conflicts=('bpftrace')
provides=('bpftrace')
source=("git+https://github.com/bpftrace/bpftrace.git")
sha512sums=('SKIP')
options=('!strip' '!debug')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -S bpftrace -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_BPF_BCC=ON
  cmake --build build
}

package() {
  depends+=(
    'binutils' 'libsframe.so'
  )

  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
