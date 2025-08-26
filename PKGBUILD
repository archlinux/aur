# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Premake"
_name="${_Name,,}"
pkgver=2.4
pkgname="${_name}${pkgver%%.*}"
pkgrel=3
pkgdesc="A simple build configuration and project generation tool"
arch=('i686' 'x86_64')
url="https://premake.github.io"
license=('BSD-3-Clause')
depends=('glibc' 'lua40')
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}.zip::https://downloads.sourceforge.net/project/${_name}/${_Name}/${pkgver}/${_name}-src-${pkgver}.zip"
        "${pkgname}_missing_includes.patch"
        "${pkgname}_build_flags.patch"
        "${pkgname}_lua.patch"
        "${pkgname}_gcc15_c23.patch")
sha256sums=('d17637ec403cf8af8f31f0a31ca2d09e3f2c6f44ed8812ac769b8cd260e9e4fd'
            '1cedf7e747f23ff16435c476509c38c43e820638ef82a3729cc8c381404bc926'
            'a20975164aa52249c3ec33203cc231b4e9bcdff2760e86d86e53c6115447078e'
            '4c66c20916c5d0e78d0755bd6753244465726cb4fab1d72089efe47dd847e244'
            '773a96ae0974156b8709a6d825bebd1a0eb7da7de9a0615f4c2f4f806876c0d1')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_missing_includes.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_build_flags.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_lua.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_gcc15_c23.patch"
}

build() {
  export CFLAGS+=" -Wno-error=implicit-function-declaration -Wno-error=format-security"

  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "bin/${_name}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "CHANGES.txt"  "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.txt"
  install -vDm644 "README.txt"   "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -vDm644 "LICENSE.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
