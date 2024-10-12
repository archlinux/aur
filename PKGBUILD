# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="aiwnios"
pkgname="${_pkgname}-git"
pkgver=r679.f1f76a3
pkgrel=1
pkgdesc="A HolyC Compiler/Runtime for 64bit ARM/x86/RISC"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/nrootconauto/Aiwnios"
license=('BSD-3-Clause')
depends=('glibc' 'sdl2')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="Aiwnios"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  cp -f "misc/${_pkgname}.desktop.in" "${_pkgname}.desktop"
  sed -i 's|@CMAKE_INSTALL_PREFIX@|/usr|g' "${_pkgname}.desktop"

  sed -i 's|Vocab.DD|God/Vocab.DD|g' "CMakeLists.txt"
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
  install -Dm644 "README.MD" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
