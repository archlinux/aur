# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="caps-log"
pkgver=1.2.1
pkgrel=2
pkgdesc="A small, terminal-based journaling tool"
arch=('x86_64')
url="https://github.com/NikolaDucak/${pkgname}"
license=('MIT')
depends=('boost-libs' 'fmt9' 'gcc-libs' 'glibc' 'libgit2' 'openssl')
makedepends=('boost' 'cmake>=3.14' 'ftxui')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}_fix_openssl.patch")
sha256sums=('10090ffc24ae28b7c466999d47c46c649daacbac86107d909d78bafef0e012d7'
            'b86336c24292ecbf3a627129a0f6c416d121c16ea93ec5735d2a8049572de1e7')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "../${pkgname}_fix_openssl.patch"
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCAPS_LOG_BUILD_TESTS=OFF \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENCE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
