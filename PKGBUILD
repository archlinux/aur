# Maintainer: Bogdan Burlacu <bogdan.burlacu@pm.me>

pkgname=mingw-w64-openlibm
pkgver=0.7.0
pkgrel=1
pkgdesc="High quality system independent, portable, open source libm implementation (mingw-w64)"
arch=('any')
url="http://www.openlibm.org"
license=('GPL')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/JuliaMath/openlibm/archive/v${pkgver}.tar.gz" "openlibm_mingw64.patch")
sha256sums=('1699f773198018b55b12631db9c1801fe3ed191e618a1ee1be743f4570ae06a3' 'c5bdddd295963c15dc67747f489c618eb107fb3877fd6987fbeed4ec2f2f44f4')

# only x64 since the lib didn't build for other configs
_architectures="x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/openlibm-$pkgver/"
  patch --forward --strip=1 --input="${srcdir}/openlibm_mingw64.patch"
  sed -e 's|/usr/local||' -i Make.inc
}

build() {
  cd "${srcdir}/openlibm-$pkgver/"
  for _arch in ${_architectures}; do
  ${_arch}-make USEGCC=1
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/openlibm-$pkgver/"
    ${_arch}-make DESTDIR="${pkgdir}"/usr/"/${_arch}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/"${_arch}"/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/"${_arch}"/lib/*.a
  done
}
