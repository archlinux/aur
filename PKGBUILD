#
# PKGBUILD for sidfactory2 (SID Factory II))
#
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
# blog: http://blog.chordian.net/sf2/
# github: https://github.com/Chordian/sidfactory2
#

_pkgname=sidfactory2
#_pkgver=20221007
#_commit=8a5dc723da875ba31e361f64c9de415525fd0e35

pkg_ident="release-${_pkgver//_/-}"
pkg_name_ver="${_pkgname}-${_pkgver//_/-}"
pkg_name_dir="${_pkgname}"

#pkg_ident="${_commit}"
#pkg_name_ver="${_pkgname}-${_commit}"
#pkg_name_dir="${pkg_name_ver}"

pkgname=${_pkgname}-git
pkgver=20221007.r1.g821d0d9
pkgrel=1
pkgdesc="Cross-platform editor for composing music for the Commodore C64 SID chip"
arch=('i686' 'x86_64')
url="https://github.com/Chordian/sidfactory2"
license=('GPL')
makedepends=('pkgconfig' 'make' 'gcc')
depends=('sdl2')
optdepends=()
conflicts=('sidfactory2')

#
source=("${_pkgname}::git+https://github.com/Chordian/${_pkgname}.git")

#
md5sums=('SKIP')

#
#
#
pkgver()
{
  cd "${srcdir}/${pkg_name_dir}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/^release\.//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

#
#
#
prepare()
{
  cd "${srcdir}/${pkg_name_dir}"
  #cp "${startdir}/Makefile.sf2" Makefile
  #patch -b -p0 < "${startdir}/patch-Makefile.diff"
}

#
#
#
build()
{
  cd "${srcdir}/${pkg_name_dir}"
  make
}

#
#
#
package()
{
  cd "${srcdir}/${pkg_name_dir}"
  #make dist

  #install -m 755 -D "${srcdir}/${pkg_name_dir}/artifacts/SIDFactoryII" "${pkgdir}/usr/bin/SIDFactoryII.exe"
  #ln -sf SIDFactoryII "${pkgdir}/usr/bin/sidfactory2"
  #ln -sf sf2 "${pkgdir}/usr/bin/sidfactory2"

  #for aa in "${srcdir}/${pkg_name_dir}/dist/documentation/"*.txt; do
  #  aaa=$(basename "${aa}")
  #  install -m 644 -D "${aa}" "${pkgdir}/usr/share/doc/${pkgname}/${aaa}"
  #done

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -R "${srcdir}/${pkg_name_dir}/dist/documentation/"* "${pkgdir}/usr/share/doc/${pkgname}/"

  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_dir}/artifacts/config" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_dir}/artifacts/drivers" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_dir}/artifacts/overlay" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_dir}/artifacts/color_schemes" "${pkgdir}/usr/share/${pkgname}"
  #cp -R "${srcdir}/${pkg_name_dir}/artifacts/music" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_dir}/SIDFactoryII/music" "${pkgdir}/usr/share/${pkgname}"

  #
  #make -j1 DESTDIR="${pkgdir}" install
  #install -m 644 -D "${srcdir}/${pkg_name_dir}/SIDFactoryII/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  #

  # HACK: SF2 expects to find drivers etc in the same dir as the binary  :-S
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  install -m 755 -D "${srcdir}/${pkg_name_dir}/artifacts/SIDFactoryII" "${pkgdir}/opt/${_pkgname}/SIDFactoryII"
  strip "${pkgdir}/opt/${_pkgname}/SIDFactoryII"

  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${_pkgname}/SIDFactoryII" "${pkgdir}/usr/bin/SIDFactoryII"
  ln -sf SIDFactoryII "${pkgdir}/usr/bin/sidfactory2"
  ln -sf SIDFactoryII "${pkgdir}/usr/bin/sf2"

  ln -s "/usr/share/${pkgname}/config" "${pkgdir}/opt/${_pkgname}/"
  ln -s "/usr/share/${pkgname}/drivers" "${pkgdir}/opt/${_pkgname}/"
  ln -s "/usr/share/${pkgname}/overlay" "${pkgdir}/opt/${_pkgname}/"
  ln -s "/usr/share/${pkgname}/color_schemes" "${pkgdir}/opt/${_pkgname}/"
  ln -s "/usr/share/${pkgname}/music" "${pkgdir}/opt/${_pkgname}/"

}

#
# EOF
#
