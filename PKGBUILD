#
# PKGBUILD for asmotor
#
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#

_pkgname=asmotor
_pkgver=1.3.2
#_commit=fed95a77b995fc594c83d84eee073af1a396cf2b

pkg_ident="${_pkgver//_/-}"
pkg_name_ver="${_pkgname}-${_pkgver//_/-}"

#pkg_ident="${_commit}"
#pkg_name_ver="${_pkgname}-${_commit}"

pkg_name_dir="${_pkgname}-release-${_pkgver}"

pkgname=${_pkgname}
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Portable, generic assembler engine written in ANSI C99 - supporting 680x0 family, 6502, MIPS32, Z80, Game Boy, DCPU-16, CHIP-8/SCHIP and RC811 CPUs"
arch=('i686' 'x86_64')
url="https://github.com/asmotor/asmotor"
license=('GPL-3.0-only')
makedepends=('pkgconfig' 'cmake' 'gcc')
depends=()
optdepends=()
provides=('asmmotor')
conflicts=('asmmotor')
source=(
        "${_pkgname}-${pkgver}.tar.gz::https://github.com/asmotor/${_pkgname}/archive/refs/tags/release-${pkg_ident}.tar.gz"
        "${_pkgname}-util-master.tar.gz::https://github.com/asmotor/${_pkgname}-util/archive/refs/heads/master.tar.gz"
        )
#https://github.com/asmotor/asmotor-util/archive/refs/heads/master.zip
sha256sums=(
'ecc371521471d3fbddb736414659b0b74f24b180042d16ef1dd081d2fbfeec11'
'faa780d4729ee3ff18bda9755773cd41731b32d0cf18b63e4b8cd4e81db02cca'
)
#
#
#
BUILD_DIR="_build.out"

#
#
#
prepare()
{
  cd "${srcdir}/${pkg_name_dir}"
  rmdir "util"
  ln -s "../${_pkgname}-util-master" "util"
  #patch -p0 < "${startdir}/CMakeLists.txt.patch"
}

#
#
#
build()
{
  cd "${srcdir}/${pkg_name_dir}"
  mkdir -p "${BUILD_DIR}"
  cmake -B "${BUILD_DIR}" -S . -G "Unix Makefiles" -DASMOTOR_VERSION=${pkg_ver} -DCMAKE_INSTALL_PREFIX="${pkgdir}" -DCMAKE_BUILD_TYPE=Release
  cmake --build "${BUILD_DIR}"
}

#
#
#
package()
{
  cd "${srcdir}/${pkg_name_dir}"
  mkdir -p "usr"
  cmake --install "${BUILD_DIR}" --prefix "${pkgdir}/usr/"
}

#
# EOF
#
