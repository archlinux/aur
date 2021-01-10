# Maintainer: Nick Adams <nick at mutablemango dot com>
# Contributor: Troy Engel <troyengel+arch at gmail dot com>

pkgname=nfstrace
pkgver=0.4.3.2
pkgrel=2
pkgdesc="NFS and CIFS tracing/monitoring/capturing/analyzing tool"
url="https://github.com/epam/nfstrace/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libtirpc')
makedepends=('cmake' 'libpcap' 'json-c' 'ncurses')

source=("$pkgname"-"$pkgver"_b220d04.zip::https://github.com/epam/nfstrace/archive/b220d04cfcaf537cecd68a70b5a44551a535465b.zip)

sha256sums=('55e49244c36cb3f3af55b3aa7c88cc9b54f53e1769ce4213444b466f939c1c6b')

zipdir="nfstrace-b220d04cfcaf537cecd68a70b5a44551a535465b"

build() {
  # make sure repetitive builds are clean
  [[ -d "${srcdir}/${zipdir}/release" ]] && \
    rm -rf "${srcdir}/${zipdir}/release"
  mkdir "${srcdir}/${zipdir}/release"
  cd "${srcdir}/${zipdir}/release"

  CXXFLAGS=-isystem\ /usr/include/tirpc/
  # Use this line instead if you want clang/llvm instead of gcc:
  #  CC="clang" CXX="clang++" cmake ../ \
  cmake ../ \
    -DCMAKE_EXE_LINKER_FLAGS=-ltirpc \
    -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${zipdir}/release"
  make DESTDIR="${pkgdir}/" install
}

