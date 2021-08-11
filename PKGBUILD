# Maintainer: xeruf <27f at pm dot me>

pkgbasename=exfat
pkgname=${pkgbasename}-utils-debug-git
pkgver=v1.3.0.r28.gab19b44
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
  cd ${pkgbasename}
  sed -i '/#define exfat_debug/D' fsck/main.c fuse/main.c
  autoreconf -fiv
}

build() {
  cd ${pkgbasename}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make CCFLAGS="${CFLAGS} ${CPPFLAGS} -std=c99" LINKFLAGS="${LDFLAGS}"
}

package() {
  cd ${pkgbasename}
  make DESTDIR="${pkgdir}" install
  install -Dm644 */*.8 -t "${pkgdir}"/usr/share/man/man8
}

pkgver() {
  cd ${pkgbasename}
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
