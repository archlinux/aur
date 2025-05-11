# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=freeimage-vpinball-git
pkgver=r1926.b161345
pkgrel=1
pkgdesc="Fork of freeimage with patches specifically for vpinball (DO NOT INSTALL IF YOU DO NOT NEED IT)"
arch=('x86_64')
url="https://github.com/toxieainc/freeimage"
license=('GPL-3.0-or-later' 'GPL-2.0-or-later' 'LicenseRef-FreeImagePublicLicense')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cmake')
provides=('freeimage' 'freeimage-vpinball-git')
conflicts=('freeimage')
source=("${pkgname}::git+https://github.com/toxieainc/freeimage.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}  # pkgver

build() {
  cd "${srcdir}/${pkgname}"
  # because of https://github.com/toxieainc/freeimage/pull/3
  sed -i 's%source/FreeImage.h%Source/FreeImage.h%g' CMakeLists.txt
  #
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
  set -x
  DESTDIR="${pkgdir}" make install
  set +x
  install -Dm644 "${srcdir}/${pkgname}/license-fi.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-fi.txt"
  install -Dm644 "${srcdir}/${pkgname}/license-gplv2.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-gplv2.txt"
  install -Dm644 "${srcdir}/${pkgname}/license-gplv3.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-gplv3.txt"
}  # package
