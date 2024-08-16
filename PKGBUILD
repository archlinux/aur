# Maintainer:  Rubin Simons <me@rubin55.org>

_pkgname=marsdev
pkgname=${_pkgname}-git
pkgver=r153.d4d51e1
pkgrel=5
pkgdesc="Cross-platform Sega Mega Drive / Super 32X / Sharp X68000 toolchain"
arch=('x86_64')
url="https://github.com/andwn/${_pkgname}"
makedepends=('boost' 'texinfo' 'wget' 'java-environment>=11')
depends=('java-environment>=11')
provides=('marsdev' 'x68k-tools' 'sik-tools' 'flamewing-tools' 'sgdk')
license=('MIT')
source=("git+$url")
sha256sums=('SKIP')
options=('!strip' '!debug' '!lto')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export   CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -fstack-clash-protection -fcf-protection"
  export CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -fstack-clash-protection -fcf-protection"
  export  LDFLAGS="-static-libstdc++ -static-libgcc -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
  export MAKEFLAGS=--jobs=1
  export MARS_INSTALL_DIR="${pkgdir}/opt/marsdev"
  export SGDK_VER="master"
  echo "CFLAGS: ${CFLAGS}"
  echo "CXXFLAGS: ${CXXFLAGS}"
  echo "LDFLAGS: ${LDFLAGS}"
  echo "MAKEFLAGS: ${MAKEFLAGS}"
  echo "MARS_INSTALL_DIR: ${MARS_INSTALL_DIR}"
  echo "SGDK_VER: ${SGDK_VER}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make m68k-toolchain-newlib
  make sh-toolchain-newlib
  make x68k-tools
  make sik-tools
  make flamewing-tools
  make sgdk
}

package() {
  cd "${srcdir}/${_pkgname}"
  make install
  cp -Rpd "${srcdir}/${_pkgname}/examples" "${pkgdir}/opt/marsdev/examples";
  sed -i "s|${pkgdir}||g" "${pkgdir}/opt/marsdev/mars.sh"
  mv "${pkgdir}/opt/marsdev/mars.sh" "${pkgdir}/opt/marsdev/marsdev.sh"
}
