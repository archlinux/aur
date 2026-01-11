# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-service-bin
_pkgname=mkl-service
pkgver=2.5.2
_build=py314hacdc0fc_0
pkgrel=1
pkgdesc="Python bindings to MKL service functions - prebuilt binaries from Anaconda"
arch=(x86_64)
license=(BSD-3-Clause)
url="https://github.com/IntelPython/mkl-service"
provides=("python-mkl-service=${pkgver}")
conflicts=(python-mkl-service)
depends=(python intel-oneapi-mkl)
makedepends=(jq)
source=(https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${pkgver}-${_build}.tar.bz2)
sha256sums=('e0f4e8ecc1f1ab001a1d3f8c9bacd36ab48f209e1746a5885efec53e288d87c3')

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
