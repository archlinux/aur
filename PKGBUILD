# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=libserum-concentrate-git
pkgver=r333.b6f7ea2
pkgrel=1
pkgdesc="Fork of libserum, a cross-platform library for decoding Serum files & colorization format for pinball ROMs"
arch=('x86_64')
url="https://github.com/PPUC/libserum_concentrate"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cmake')
provides=('libserum-concentrate' 'libserum-concentrate-git')
source=("${pkgname}::git+https://github.com/PPUC/libserum_concentrate.git")
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
         -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}  # build

package() {
  cd "${srcdir}/${pkgname}/build"
  DESTDIR="${pkgdir}" make install
  install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}  # package
