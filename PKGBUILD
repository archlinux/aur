# Maintainer:  dreieck
# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

_pkgname=cuda-z
pkgname=cuda-z-svn
epoch=1
pkgver=0.11.r291.20180317
pkgrel=1
pkgdesc="CUDA Information Utility."
url="http://cuda-z.sourceforge.net/"
license=("GPL3")
arch=("x86_64")
depends=(
  "cuda"
  "qt5-base"
)
makedepends=(
  "svn"
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::svn://svn.code.sf.net/p/cuda-z/code/trunk"
)
sha256sums=(
  'SKIP'
)

#_svntrunk="http://${_pkgname}.svn.sourceforge.net/svnroot/${_pkgname}/trunk"
#_svnmod="${_pkgname}"

prepare() {
  cd "${srcdir}/${_pkgname}/"

  sed -i 's/+= sm_10/+=/g' cuda-z.pro
  sed -i 's/+= sm_11/+=/g' cuda-z.pro
  sed -i 's/+= sm_13/+=/g' cuda-z.pro

  sed -i 's/\/usr\/local\/cuda/\/opt\/cuda/g' cuda-z.pro
  sed -i 's/\/usr\/local\/cuda/\/opt\/cuda/g' cuda.pri
  sed -i 's/\/usr\/local\/cuda/\/opt\/cuda/g' ./bld/bin/pkg-linux.sh
  sed -i 's/\/opt\/cuda-toolkit\/lib/\/opt\/cuda\/lib\
    unix:LIBPATH += \/opt\/cuda\/lib64/' cuda-z.pro

  svn log > svn.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}/"

  _ver_major="$(grep -E '^[[:space:]]*#define[[:space:]]+CZ_VER_MAJOR[[:space:]]+' src/version.h | awk '{print $3}' | tr -d \'\")"
  _ver_minor="$(grep -E '^[[:space:]]*#define[[:space:]]+CZ_VER_MINOR[[:space:]]+' src/version.h | awk '{print $3}' | tr -d \'\")"
  _ver_string="$(grep -E '^[[:space:]]*#define[[:space:]]+CZ_VER_STRING[[:space:]]+' src/version.h | awk '{print $3}' | tr -d \'\")"
  _ver="${_ver_string}"
  _rev="$(svn info | grep '^Revision' | cut -d' ' -f2)"
  _date="$(svn info | grep -E '^Last Changed Date:' | cut -d' ' -f4 | tr -d '-')"

  printf '%s\n' "${_ver}.r${_rev}.${_date}"
}

build() {
  cd "${srcdir}/${_pkgname}/"

  PATH+=":/opt/cuda/bin"
  export PATH

  qmake && make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}/"

  install -Dvm755 "bin/cuda-z" "${pkgdir}/usr/bin/cuda-z"

  for _docfile in svn.log doc/*; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  for _licensefile in LICENSE.GPL3; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_licensefile}"
  done
}
