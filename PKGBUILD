# Maintainer: xeruf <27f at pm dot me>

_pkgbasename=exfat
pkgname=${_pkgbasename}-utils-debug-git
pkgver=1.3.0.r28.gab19b44
pkgrel=1
pkgdesc='Utilities for the exFAT file system with debugging enabled'
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='https://github.com/relan/exfat'
license=('GPL2')
depends=('glibc')
provides=('exfat-utils')
conflicts=('fuse-exfat' 'exfat-utils')
source=('git+https://github.com/relan/exfat')
b2sums=('SKIP')

prepare() {
  cd ${_pkgbasename}
  sed -i '/#define exfat_debug/D' fsck/main.c fuse/main.c
  autoreconf -fiv
}

build() {
  cd ${_pkgbasename}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make CCFLAGS="${CFLAGS} ${CPPFLAGS} -std=c99" LINKFLAGS="${LDFLAGS}"
}

package() {
  cd ${_pkgbasename}
  make DESTDIR="${pkgdir}" install
  install -Dm644 */*.8 -t "${pkgdir}"/usr/share/man/man8
}

pkgver() {
  cd ${_pkgbasename}
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
