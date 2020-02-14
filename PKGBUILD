# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libcutensor
pkgver=1.0.1
_pkg_file_name="libcutensor-linux-x86_64-${pkgver}.tar.gz"
pkgrel=1
pkgdesc="GPU-accelerated tensor linear algebra library"
arch=('x86_64')
url='https://developer.nvidia.com/cutensor'
license=('custom::NVIDIA')
depends=('gcc-libs')

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
  if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
    ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
  else
    msg2 ""
    msg2 "The package can be downloaded here: "
    msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
    msg2 ""
  fi
fi

source=("local://${_pkg_file_name}")
sha256sums=('SKIP')

_create_links() {
  # create soname links
  for _lib in $(find "${pkgdir}" -name '*.so*'); do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

package() {
  cd libcutensor
  for i in $(find include -type f); do install -Dm644 ${i} "${pkgdir}/usr/${i}"; done
  install -Dm644 "lib/10.2/${pkgname}_static.a" "${pkgdir}/usr/lib/${pkgname}_static.a"
  install -Dm755 "lib/10.2/${pkgname}.so.${pkgver}" "${pkgdir}/usr/lib/${pkgname}.so.${pkgver}"

  _create_links

  install -Dm644 license.pdf  "${pkgdir}/usr/share/licenses/${pkgname}/license.pdf"
}
