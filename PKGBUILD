# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libsigc++-patched
pkgdesc='A full callback system for use in widget libraries - V2 (with fixed slot_rep)'
pkgver=2.10.1
pkgrel=1
depends=('gcc-libs')
provides=("libsigc++=${pkgver}" "libsigc++2.0=${pkgver}")
conflicts=('libsigc++' 'libsigc++2.0')
arch=('x86_64')
license=('LGPL')
url="http://libsigc.sourceforge.net/"
makedepends=('gcc-libs' 'git' 'mm-common' 'doxygen' 'libxslt' 'graphviz')
options=('!emptydirs')
_commit=df5857af447d473d5c843c4383fa8b7982c6242a  # tags/2.10.1^0
source=("git+https://github.com/libsigcplusplus/libsigcplusplus#commit=$_commit"
        '0001-slot_rep-Make-destructor-destroy-and-dup-virtual.patch')
sha256sums=('SKIP'
            '56d3e4ca0394bdc427fe204cde12a34af7f9df31e2c81e332ad6776a4ae39990')

pkgver() {
  cd libsigcplusplus
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libsigcplusplus
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libsigcplusplus
  ./configure --prefix=/usr

  # Process the .m4 files
  cd sigc++
  make all-am
  cd ..

  # Apply patch
  patch -Np1 <'../0001-slot_rep-Make-destructor-destroy-and-dup-virtual.patch'

  # Make the rest
  make
}

check() {
  cd libsigcplusplus
  make check
}

package() {
  cd libsigcplusplus
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="${pkgdir}" install
}
