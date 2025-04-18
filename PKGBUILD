# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="fart"
_basename="fart-it"
pkgver=1.99d
pkgrel=1
pkgdesc="Find And Replace Text command line utility. New & improved version of the well-known grep command."
arch=('x86_64')
url="https://github.com/lionello/${_basename}"
license=('custom:None')
depends=('glibc')
provides=("lib${pkgname}.so")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7841aeba26d09a902bf1bf36b65e1baa4b1fd48d1199843b7ad3a2a02ca05e90e0bf8efc7c00dfa23a2343c392adbd200f362da071a0413f339b0ebcbea277db')

build() {
  cd "${srcdir}/${_pkgsrc}"
  gcc ${CFLAGS} -fPIC -c wildmat.c -o wildmat.o
  gcc ${CFLAGS} -fPIC -c fart_shared.c -o fart_shared.o
  gcc -shared -o "lib${pkgname}.so.1" wildmat.o fart_shared.o ${LDFLAGS}

  g++ ${CXXFLAGS} -c fart.cpp -o fart.o
  g++ fart.o -L. -lfart -o "${pkgname}" ${LDFLAGS}
}

package() { 
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "lib${pkgname}.so.1" "${pkgdir}/usr/lib/lib${pkgname}.so.1"
  install -vDm644 "fart_shared.h" "${pkgdir}/usr/include/${pkgname}.h"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"

  cd "${pkgdir}/usr/lib"
  ln -vsf "lib${pkgname}.so.1" "lib${pkgname}.so"
}
