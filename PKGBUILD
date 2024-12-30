# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-service-bin
_pkgname=mkl-service
_pkgver=2.4.0
_build=py313h5eee18b_1
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
pkgdesc="Python bindings to MKL service functions - prebuilt binaries from Anaconda"
arch=(x86_64)
license=(BSD-3-Clause)
url="https://github.com/IntelPython/mkl-service"
provides=("python-mkl-service=$_pkgver")
conflicts=(python-mkl-service)
depends=(python intel-oneapi-mkl)
makedepends=(jq)
source=(https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2)
sha256sums=('26ebda71e094f16416a219a2cb0cfd96de279646dfe84c01510d78e8e4003742')

prepare() {
  # Prefix replacement
  for row in $(jq -c '.paths[] | select(has("prefix_placeholder"))' "info/paths.json"); do
    path=$(echo $row | jq -r '._path')
    prefix=$(echo $row | jq -r '.prefix_placeholder')
    sed -i "s:${prefix}:/usr:g" "${path}"
  done
}

package() {
  mkdir "${pkgdir}/usr"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
