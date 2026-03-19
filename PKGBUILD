# Maintainer: Natounlars <19883047@qq.com>

pkgname=dtrace-utils-git
pkgver=2.0.6.r20.ga000357c
pkgrel=1
pkgdesc='DTrace for Linux - a dynamic tracing framework (development version from git)'
arch=('x86_64' 'aarch64')
url='https://github.com/oracle/dtrace-utils'
license=('UPL-1.0')
provides=('dtrace-utils')
conflicts=('dtrace-utils' 'bpf-dtrace-utils' 'systemtap') 
depends=(
    'wireshark-cli'
    'fuse3'
    'glibc'
    'libpcap'
    'libpfm'
)
makedepends=(
    'git'
    'bison'
    'flex'
    'gcc'          
    'valgrind'
    'bpf-unknown-none-gcc'
    'bpf-unknown-none-binutils'
    'lib32-glibc' 
)

source=("git+https://github.com/oracle/dtrace-utils#branch=devel")
sha256sums=('SKIP')

options=('!lto')

pkgver() {
  cd "$srcdir/dtrace-utils"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/dtrace-utils"
  if [ -f ./autogen.sh ]; then
    ./autogen.sh
  elif [ -f ./bootstrap ]; then
    ./bootstrap
  fi
}

build() {
  cd "$srcdir/dtrace-utils"

  ./configure --prefix=/usr --bindir=/usr/bin --libdir=/usr/lib

  make --no-print-directory
}

check() {
  cd "$srcdir/dtrace-utils"
}

package() {
  cd "$srcdir/dtrace-utils"
  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
