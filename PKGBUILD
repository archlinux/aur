#
# PKGBUILD for asmotor-git
#
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#

_pkgname=asmotor
#_pkgver=1.1.0
#_commit=fed95a77b995fc594c83d84eee073af1a396cf2b

#pkg_ident="${_pkgver//_/-}"
#pkg_name_ver="${_pkgname}-${_pkgver//_/-}"

#pkg_ident="${_commit}"
#pkg_name_ver="${_pkgname}-${_commit}"


pkgname=${_pkgname}-git
pkgver=1.1.1.r8.g320ae2d
pkg_name_ver="${_pkgname}-${pkgver//_/-}"

pkgrel=1
pkgdesc="Portable, generic assembler engine written in ANSI C99 - supporting 680x0 family, 6502, MIPS32, Z80, Game Boy, DCPU-16, CHIP-8/SCHIP and RC811 CPUs"
arch=('i686' 'x86_64')
url="https://github.com/asmotor/asmotor"
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'gcc')
depends=()
optdepends=()
provides=('asmmotor')
conflicts=('asmmotor')
source=("${_pkgname}::git+https://github.com/asmotor/${_pkgname}"
        "${_pkgname}-util::git+https://github.com/asmotor/${_pkgname}-util"
        )
md5sums=('SKIP'
         'SKIP'
         )

#
#
#
pkg_name_dir="${_pkgname}"
BUILD_DIR="_build.out"


#
#
#
pkgver()
{
  cd "${srcdir}/${pkg_name_dir}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


#
#
#
prepare()
{
  cd "${srcdir}/${pkg_name_dir}"
  rmdir "util"
  ln -s "../${_pkgname}-util" "util"

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
