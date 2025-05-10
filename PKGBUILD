# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=libdmdutil-git
pkgver=r129.bb4e0ae
pkgrel=1
pkgdesc="A cross platform library for performing DMD tasks."
arch=('x86_64')
url="https://github.com/vpinball/libdmdutil"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'libserialport' 'libzedmd' 'libserum-concentrate' 'libpupdmd' 'sockpp')
makedepends=('git' 'cmake' 'cargs')
provides=('libdmdutil' 'libdmdutil-git')
source=("${pkgname}::git+https://github.com/vpinball/libdmdutil.git")
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
