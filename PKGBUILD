# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="Aiwnios"
pkgname="${_name,,}"
pkgver=0.9.0
pkgrel=1
pkgdesc="A HolyC Compiler/Runtime for 64bit ARM/x86/RISC"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/nrootconauto/${_name}"
license=('BSD-3-Clause')
depends=('glibc' 'sdl2')
makedepends=('cmake>=3.13')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3318d3aad6c5c788c85bd1e9d4efe9dc0961d7a190df6d0b4b9ab175282e4e07')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  cp -f "misc/${pkgname}.desktop.in" "${pkgname}.desktop"
  sed -i 's|@CMAKE_INSTALL_PREFIX@|/usr|g' "${pkgname}.desktop"
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.MD" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
