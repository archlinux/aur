# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=libcutensor
pkgname=('libcutensor'
         'libcutensor-common'
         'libcutensor-cuda10.2'
         'libcutensor-cuda11.0'
         )
pkgver=1.6.0.3
pkgrel=1
pkgdesc="GPU-accelerated tensor linear algebra library"
arch=('x86_64')
url='https://developer.nvidia.com/cutensor'
license=('custom:NVIDIA')
source=("libcutensor-linux-x86_64-${pkgver}.tar.xz::https://developer.download.nvidia.com/compute/cutensor/redist/libcutensor/linux-x86_64/libcutensor-linux-x86_64-${pkgver}-archive.tar.xz")
sha256sums=('b07e32a37eee1df7d9330e6d7faf9baf7fffd58007e2544164ea30aec49a5281')

_create_links() {
  # create soname links
  find "${pkgdir}" -type f -name '*.so*' -print0 | while read -d $'\0' _lib; do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*)\.so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

package_libcutensor() {
  depends=('gcc-libs'
           'cuda'
           "libcutensor-common=${pkgver}"
           )
  cd "libcutensor-linux-x86_64-${pkgver}-archive"
  install -Dm644 lib/11/libcutensor_static.a         "${pkgdir}/opt/cuda/targets/x86_64-linux/lib/libcutensor_static.a"
  install -Dm755 "lib/11/libcutensor.so.${pkgver:0:5}" "${pkgdir}/opt/cuda/targets/x86_64-linux/lib/libcutensor.so.${pkgver:0:5}"

  _create_links

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/libcutensor-common/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

package_libcutensor-cuda10.2() {
  pkgdesc="GPU-accelerated tensor linear algebra library (CUDA 10.2)"
  depends=('gcc-libs'
           'cuda-10.2'
           "libcutensor-common=${pkgver}"
           )

  cd "libcutensor-linux-x86_64-${pkgver}-archive"
  install -Dm644 lib/10.2/libcutensor_static.a         "${pkgdir}/opt/cuda-10.2/targets/x86_64-linux/lib/libcutensor_static.a"
  install -Dm755 "lib/10.2/libcutensor.so.${pkgver:0:5}" "${pkgdir}/opt/cuda-10.2/targets/x86_64-linux/lib/libcutensor.so.${pkgver:0:5}"

  _create_links

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/libcutensor-common/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

package_libcutensor-cuda11.0() {
  pkgdesc="GPU-accelerated tensor linear algebra library (CUDA 11.0)"
  depends=('gcc-libs'
           'cuda-11.0'
           "libcutensor-common=${pkgver}"
           )

  cd "libcutensor-linux-x86_64-${pkgver}-archive"
  install -Dm644 lib/11.0/libcutensor_static.a         "${pkgdir}/opt/cuda-11.0/targets/x86_64-linux/lib/libcutensor_static.a"
  install -Dm755 "lib/11.0/libcutensor.so.${pkgver:0:5}" "${pkgdir}/opt/cuda-11.0/targets/x86_64-linux/lib/libcutensor.so.${pkgver:0:5}"

  _create_links

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/libcutensor-common/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

package_libcutensor-common() {
  pkgdesc="GPU-accelerated tensor linear algebra library (Common bits)"
  arch=('any')

  cd "libcutensor-linux-x86_64-${pkgver}-archive"
  for i in $(find include -type f); do install -Dm644 ${i} "${pkgdir}/usr/${i}"; done

  install -Dm644 LICENSE  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
