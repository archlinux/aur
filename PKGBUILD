# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="infekt-cli"
pkgver=1.3.0
pkgrel=1
pkgdesc="The ultimate best NFO viewer, ever!"
arch=('any')
url="https://infekt.ws"
_url="https://github.com/syndicodefront/infekt"
license=('GPL-2.0-or-later')
makedepends=('cmake>=3.2.0' 'zlib' 'pkgconf')
depends=('glibc' 'gcc-libs' 'cairo' 'libpng')
optdepends=('infekt-gtk: GTK2 user interface')
_pkgsrc="infekt-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/v${pkgver}.tar.gz"
        "${pkgname}_fix_build_type.patch")
sha256sums=('0768e7147288c7150d7c8d933f36dd99df5d13e96071b3870ce1c61cc9a0765c'
            '1366192d7ed37dad1eb38f4b6b639740afb72ece6d47372d0bb198b0e0c3ed2f')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 -i "${srcdir}/${pkgname}_fix_build_type.patch"
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

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
