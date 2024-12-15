pkgname=bpf-dtrace-utils
pkgver=2.0.2
pkgrel=2
pkgdesc='bpf-dtrace-utils contains the Userspace portion of the DTrace port to Linux (with eBPF backend)'
arch=('x86_64')
url='https://github.com/oracle/dtrace-utils'
license=('UPL-1.0')
makedepends=(
  'lib32-glibc'
  'bpf-unknown-none-binutils'
  'bpf-unknown-none-gcc'
  'libpfm'
  'libpcap'
  'wireshark-cli'
  'valgrind'
  'fuse3'
  'linux-headers'
)
# systemtap also provides /usr/bin/dtrace
# (sbin does not exist on archlinux)
conflicts=('systemtap')
depends=(
  'wireshark-cli'
  'fuse3'
)
source=("git+https://github.com/oracle/dtrace-utils#tag=$pkgver")
sha256sums=('SKIP')
# !makeflags/!buildflags is a workaround for github issue #98
# !strip is required to prevent important binary sections from being stripped (see #116)
# !lto works around issue #86
options=('!strip' '!lto' '!makeflags' '!buildflags')
build() {
  cd "$srcdir/dtrace-utils"
  ./configure --prefix=/usr --bindir=/usr/bin --libdir=/usr/lib
  make
}

package() {
  cd "$srcdir/dtrace-utils"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
