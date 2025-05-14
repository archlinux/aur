# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=libdof-git
pkgver=r10.9213874
pkgrel=1
pkgdesc="A cross platform library for performing Direct Output Framework tasks."
arch=('x86_64')
url="https://github.com/jsm174/libdof"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'hidapi')
makedepends=('git' 'cargs' 'sockpp' 'libserialport' 'cmake')
provides=('libdof' 'libdof-git')
source=("${pkgname}::git+https://github.com/jsm174/libdof.git")
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
