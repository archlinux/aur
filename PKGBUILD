# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="TermGL"
pkgname="${_Name,,}"
pkgver=1.6.0
pkgrel=1
pkgdesc="2D & 3D graphics engine in the terminal [C/C++]"
arch=(
  'x86_64'
)
url="https://github.com/wojciech-graj/${_Name}"
license=('MIT')
depends=(
  'glibc'
)
provides=(
  "lib${pkgname}"
  "lib${pkgname}.so"
)
conflicts=(
  "lib${pkgname}<=1.5.0-1"
)
replaces=(
  "lib${pkgname}<=1.5.0-1"
)
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('75646c79fd06f23cffd0186fc9d6ac3a10ff5b262a36faf0d9733af0496c4bc1')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e "s|/usr/local|${pkgdir}/usr|g" \
      -e 's|-O3||g' \
      -i 'Makefile'
}

build() {
  export LDFLAGS+=" -Wl,-soname,lib${pkgname}.so.${pkgver%%.*}"

  cd "${srcdir}/${_pkgsrc}"
  make shared
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  # install -vd "${pkgdir}/usr/include" "${pkgdir}/usr/lib"
  # make install

  install -vDm644 "lib${pkgname}.so" "${pkgdir}/usr/lib/lib${pkgname}.so.${pkgver}"
  install -vDm644 "${pkgname}.h"     "${pkgdir}/usr/include/${pkgname}.h"

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}/usr/lib"
  for lib in lib*.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*.[0-9]*}"
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*}"
  done
}
