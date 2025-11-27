# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=elfutils-git
pkgver=0.194.r16.g4a5cf8be
pkgrel=1
pkgdesc="Utilities and libraries to handle ELF object files and DWARF debugging information"
arch=('i686' 'x86_64')
url="https://sourceware.org/elfutils/"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'json-c' 'libarchive.so' 'libbz2.so' 'libcurl.so' 'liblzma.so' 'libmicrohttpd.so' 'libsqlite3.so' 'libz.so' 'libzstd.so' 'sh')
makedepends=('git' 'bzip2' 'curl' 'libarchive' 'libmicrohttpd' 'sqlite' 'xz' 'zlib' 'zstd')
provides=("elfutils=$pkgver" "debuginfod=$pkgver" "libelf=$pkgver")
conflicts=('elfutils' 'debuginfod' 'libelf')
options=('staticlibs')
source=("git+https://sourceware.org/git/elfutils.git")
sha256sums=('SKIP')


pkgver() {
  cd "elfutils"

  git describe --long --tags | sed 's/^elfutils-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "elfutils"

  autoreconf -fi
  CFLAGS="$CFLAGS -ffat-lto-objects -g" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects -g" \
  ./configure \
    --prefix="/usr" \
    --program-prefix="eu-" \
    --enable-deterministic-archives \
    --enable-maintainer-mode
  make
}

check() {
  cd "elfutils"

  #make check
}

package() {
  cd "elfutils"

  make DESTDIR="$pkgdir" install
}
