# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=libzedmd-git
pkgver=r292.1547728
pkgrel=1
pkgdesc="ZeDMD communication library"
arch=('x86_64')
url="https://github.com/PPUC/libzedmd"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'libserialport' 'sockpp')
makedepends=('git' 'cmake' 'cargs')
provides=('libzedmd-git' 'libzedmd')
source=("${pkgname}::git+https://github.com/PPUC/libzedmd.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}  # pkgver

build() {
  cd "${srcdir}/${pkgname}"
  cmake -B build \
	 -DPLATFORM=linux \
	 -DARCH=x64 \
	 -DCMAKE_BUILD_TYPE=Release \
	 -DBUILD_STATIC=FALSE \
	 -DPOST_BUILD_COPY_EXT_LIBS=FALSE \
         -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}  # build

package() {
  cd "${srcdir}/${pkgname}/build"
  DESTDIR="${pkgdir}" make install
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}  # package
