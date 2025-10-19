# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
# Contributor: Tommaso Sardelli <lacapannadelloziotom at gmail dot com>
pkgname=bpftrace-git
_pkgname=bpftrace
pkgver=v0.24.rc0.r180.g57c2b5863
pkgrel=1
pkgdesc='High-level tracing language for Linux eBPF'
arch=('i686' 'x86_64')
url="https://github.com/bpftrace/bpftrace"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'libelf' 'zlib' 'llvm-libs' 'clang' 'bcc' 'bpf' 'libpcap' 'zstd' 'systemd-libs')
makedepends=('binutils' 'cmake' 'cargo' 'llvm' 'git' 'linux-headers' 'ninja' 'gtest' 'cereal'
             'asciidoctor' 'xxd')
conflicts=('bpftrace')
provides=('bpftrace')
_blazesymver=v0.2.0
# Blazesym is not in the main archives, and the AUR package is very outdated.
# Once either of those have a version we can depend on, we should switch over.
source=("blazesym-${_blazesymver}.tar.gz::https://github.com/libbpf/blazesym/archive/refs/tags/${_blazesymver}.tar.gz"
        "git+https://github.com/libbpf/libbpf.git"
        "git+https://github.com/bpftrace/bpftrace.git")
sha512sums=('bff471268b98cf0d900a2fd1bee1eb86cfe3b54ad6ffd15b359a3e5601078f5b14c5c05a3b7e03b0d00f8a70a5c5cb2065438c5dd7107b4a5e7e4ad4ffec99fd'
            'SKIP'
            'SKIP')
options=('!strip' '!debug')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  (
    cd blazesym-${_blazesymver/#v/}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  )
  (
    cd bpftrace
    git submodule init
    git config submodule.libbpf.url "$srcdir/libbpf"
    git -c protocol.file.allow=always submodule update
  )
}

build() {
  # Build blazesym and copy it to where bpftrace can find it.
  # We use a static library to not collide with proper packages for blazesym
  # (which we should switch over to when they are available).
  (
    cd blazesym-${_blazesymver/#v/}
    cargo build --frozen --release --package=blazesym-c
    mkdir -p ../blazesym-install/{lib,include}
    cp target/release/libblazesym_c.a ../blazesym-install/lib/
    cp -r capi/include/* ../blazesym-install/include/
  )
  cmake -S bpftrace -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_SYSTEMD=ON \
    -DLIBBLAZESYM_INCLUDE_DIRS=${srcdir}/blazesym-install/include \
    -DLIBBLAZESYM_LIBRARIES=${srcdir}/blazesym-install/lib/libblazesym_c.a
  cmake --build build
}

package() {
  depends+=(
    'binutils' 'libsframe.so'
  )

  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
