# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="infekt-cli"
pkgname="${_pkgname}-git"
pkgver=1.3.0.r1.gcc99c16
pkgrel=1
pkgdesc="The ultimate best NFO viewer, ever!"
arch=('any')
url="infekt.ws"
_url="https://github.com/syndicodefront/infekt"
license=('GPL-2.0-or-later')
makedepends=('git' 'cmake>=3.2.0' 'zlib' 'pkgconf')
depends=('glibc' 'gcc-libs' 'cairo' 'libpng')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="infekt"
source=("${_pkgsrc}::git+${_url}.git"
        "${_pkgname}_fix_build_type.patch")
sha256sums=('SKIP'
            '1366192d7ed37dad1eb38f4b6b639740afb72ece6d47372d0bb198b0e0c3ed2f')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 -i "${srcdir}/${_pkgname}_fix_build_type.patch"
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" --output-on-failure --stop-on-failure
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
