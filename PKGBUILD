# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=libcutensor
pkgname=('libcutensor'
         'libcutensor-common'
         'libcutensor-cuda10.2'
         'libcutensor-cuda11.0'
         )
pkgver=1.3.1.3
# _pkg_file_name="libcutensor-linux-x86_64-${pkgver}.tar.gz"
pkgrel=1
pkgdesc="GPU-accelerated tensor linear algebra library"
arch=('x86_64')
url='https://developer.nvidia.com/cutensor'
license=('custom:NVIDIA')

# _DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
# if [ ! -f ${PWD}/${_pkg_file_name} ]; then
#   if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
#     ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
#   else
#     msg2 ""
#     msg2 "The package can be downloaded here: "
#     msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
#     msg2 ""
#   fi
# fi

source=("https://developer.download.nvidia.com/compute/cutensor/${pkgver:0:5}/local_installers/libcutensor-linux-x86_64-${pkgver}.tar.gz")
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

package_libcutensor() {
  depends=('gcc-libs'
           'cuda'
           'libcutensor-common'
           )
  cd libcutensor
  install -Dm644 "lib/11/libcutensor_static.a"          "${pkgdir}/opt/cuda/targets/x86_64-linux/lib/libcutensor_static.a"
  install -Dm755 "lib/11/libcutensor.so.${pkgver:0:5}" "${pkgdir}/opt/cuda/targets/x86_64-linux/lib/libcutensor.so.${pkgver:0:5}"

  _create_links

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}/usr/share/licenses/libcutensor-common/license.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

package_libcutensor-cuda10.2() {
  pkgdesc="GPU-accelerated tensor linear algebra library (CUDA 10.2)"
  depends=('gcc-libs'
           'cuda-10.2'
           'libcutensor-common'
           )

  cd libcutensor
  install -Dm644 "lib/10.2/libcutensor_static.a"             "${pkgdir}/opt/cuda-10.2/targets/x86_64-linux/lib/libcutensor_static.a"
  install -Dm755 "lib/10.2/libcutensor.so.${pkgver:0:5}" "${pkgdir}/opt/cuda-10.2/targets/x86_64-linux/lib/libcutensor.so.${pkgver:0:5}"

  _create_links

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}/usr/share/licenses/libcutensor-common/license.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

package_libcutensor-cuda11.0() {
  pkgdesc="GPU-accelerated tensor linear algebra library (CUDA 11.0)"
  depends=('gcc-libs'
           'cuda-11.0'
           'libcutensor-common'
           )

  cd libcutensor
  install -Dm644 "lib/11.0/libcutensor_static.a"         "${pkgdir}/opt/cuda-11.0/targets/x86_64-linux/lib/libcutensor_static.a"
  install -Dm755 "lib/11.0/libcutensor.so.${pkgver:0:5}" "${pkgdir}/opt/cuda-11.0/targets/x86_64-linux/lib/libcutensor.so.${pkgver:0:5}"

  _create_links

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}/usr/share/licenses/libcutensor-common/license.txt"  "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

package_libcutensor-common() {
  pkgdesc="GPU-accelerated tensor linear algebra library (Common bits)"
  arch=('any')

  cd libcutensor
  for i in $(find include -type f); do install -Dm644 ${i} "${pkgdir}/usr/${i}"; done

  install -Dm644 license.txt  "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
