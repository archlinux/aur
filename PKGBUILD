# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-numpy-mkl-bin
pkgver=2.3.5
_build=py314h5cadfd5_0
pkgrel=1
pkgdesc="Scientific tools for Python - with Intel MKL - prebuilt binaries from Anaconda"
arch=(x86_64)
license=(BSD-3-Clause)
url="https://numpy.org"
provides=("python-numpy=${pkgver}")
conflicts=(python-numpy)
depends=(python-mkl-service)
makedepends=(jq)
source=(https://repo.anaconda.com/pkgs/main/linux-64/numpy-base-${pkgver}-${_build}.tar.bz2)
sha256sums=('b96a601bdc7d27b394af69214735eae5112bf6c630dee22a31a778bcae587c41')

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
  cp -drp --no-preserve=ownership "${srcdir}/bin" "${pkgdir}/usr/bin"
  cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
  install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
