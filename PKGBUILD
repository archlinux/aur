# Maintainer:  Rubin Simons <me@rubin55.org>

_pkgname=pvsneslib
pkgname=${_pkgname}-git
pkgver=r1722.a3b165d7
pkgrel=1
pkgdesc="A free/libre toolchain to program the SNES using assembler and C"
arch=('x86_64')
url="https://github.com/alekmaul/${_pkgname}"
makedepends=('cmake' 'doxygen' 'gcc' 'git' 'make' 'zip')
provides=('pvsneslib')
license=('MIT')
source=("git+$url" "pvsneslib.sh")
sha256sums=('SKIP' 'SKIP')
options=('!strip' '!debug' '!lto')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive
  export MAKEFLAGS=--jobs=1
  export PVSNESLIB_HOME=$(pwd)
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  echo "CFLAGS: ${CFLAGS}"
  echo "CXXFLAGS: ${CXXFLAGS}"
  echo "LDFLAGS: ${LDFLAGS}"
  echo "MAKEFLAGS: ${MAKEFLAGS}"
  echo "PVSNESLIB_HOME: ${PVSNESLIB_HOME}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  mkdir -p "${pkgdir}/opt/pvsneslib"
  cd "${srcdir}/${_pkgname}/snes-examples"
  make clean
  cd ..
  cp -Rpd "${srcdir}/${_pkgname}/snes-examples" "${pkgdir}/opt/pvsneslib/examples";
  cp -Rpd "${srcdir}/${_pkgname}/pvsneslib" "${pkgdir}/opt/pvsneslib/pvsneslib";
  cp -Rpd "${srcdir}/${_pkgname}/devkitsnes" "${pkgdir}/opt/pvsneslib/devkitsnes";
  cp "${srcdir}/pvsneslib.sh" "${pkgdir}/opt/pvsneslib/pvsneslib.sh"
}
