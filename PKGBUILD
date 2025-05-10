# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=libpupdmd-git
pkgver=r24.124f45e
pkgrel=1
pkgdesc="A cross-platform library for matching PUP triggers in DMD frames."
arch=('x86_64')
url="https://github.com/ppuc/libpupdmd"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cmake')
provides=('libpupdmd-git' 'libpupdmd')
source=("${pkgname}::git+https://github.com/PPUC/libpupdmd.git")
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
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}  # package
