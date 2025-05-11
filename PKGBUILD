# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=libaltsound-git
pkgver=r23.5342108
pkgrel=1
pkgdesc="A cross platform compilation of altsound that is baked directly into VPinMAME."
arch=('x86_64')
url="https://github.com/vpinball/libaltsound"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'libbass')
makedepends=('git' 'cmake')
provides=('libaltsound' 'libaltsound-git')
source=("${pkgname}::git+https://github.com/joni999/libaltsound.git#branch=cmake-no-post-build-copy")
#source=("${pkgname}::git+https://github.com/vpinball/libaltsound.git")
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
