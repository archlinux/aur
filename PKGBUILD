# Maintainer: Jonathan Hilger <joni dot hilger at yahoo dot de>
pkgname=libpinmame-git
_pkgname=libpinmame
pkgver=r6860.65c6719
pkgrel=1
pkgdesc="Pinball Multiple Arcade Machine Emulator"
arch=('x86_64')
url="https://github.com/vpinball/pinmame"
license=('LicenseRef-MAME')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cmake')
provides=('libpinmame-git' 'libpinmame')
source=("${pkgname}::git+https://github.com/vpinball/pinmame.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}  # pkgver

build() {
  cd "${srcdir}/${pkgname}"
  cp cmake/${_pkgname}/CMakeLists.txt .
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
