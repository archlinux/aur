# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="cfitsio"
_so="9"
pkgname="${_basename}${_so}"
pkgver=4.1.0
pkgrel=1
pkgdesc="A library of C and Fortran subroutines for reading and writing data files in FITS (Flexible Image Transport System) data format (so-version ${_so})"
arch=('x86_64')
url="https://heasarc.gsfc.nasa.gov/fitsio/"
license=('LicenseRef-cfitsio')
depends=('curl' 'glibc' 'zlib')
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://heasarc.gsfc.nasa.gov/FTP/software/fitsio/${_basename::1}/${_pkgsrc}.tar.gz")
sha256sums=('b367c695d2831958e7166921c3b356d5dfa51b1ecee505b97416ba39d1b6c17a')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # shellcheck disable=SC2016
  sed -e 's|LDFLAGS=.*|LDFLAGS="$LDFLAGS"|g' -i configure.in # Fix LDFLAGS
}

build() {
  export CFLAGS+=" -std=gnu17"
  local configure_options=(
    --prefix='/usr'
    # --program-suffix="${_so}"
    --includedir="/usr/include/${pkgname}"
    --libdir="/usr/lib/${pkgname}"
    --enable-reentrant
  )
  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make shared
  make utils
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  LD_LIBRARY_PATH=. ./testprog > testprog.lis
  [[ -z $(diff testprog.lis testprog.out) ]] || return 1
  [[ -z $(cmp testprog.fit testprog.std) ]] || return 1
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}/usr"
  rm -v "bin/testprog"
  for _bin in imcopy smem speed; do
    mv -v bin/{,"${_basename}"-}$_bin
  done
  for file in bin/*; do
    mv -v "${file}" "${file}${_so}"
  done

  cd "lib/${pkgname}"
  for lib in lib*.so.*; do
    ln -sf "/usr/lib/${pkgname}/${lib}" "${pkgdir}/usr/lib/${lib}"
  done
}
