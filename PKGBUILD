# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-scipy-mkl-bin
_pkgname=scipy
_pkgver=1.14.1
_build=py313h3a69d60_0
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
pkgdesc="SciPy is open-source software for mathematics, science, and engineering - with Intel MKL - prebuilt binaries from Anaconda"
arch=(x86_64)
license=(BSD-3-Clause)
url="https://scipy.org"
provides=("python-scipy=$_pkgver")
conflicts=(python-scipy)
depends=(python-numpy python-mkl-service)
makedepends=(jq)
optdepends=('python-pillow: for image saving module')
source=(https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2)
sha256sums=('5f8d0a79df75b8058357b758c704118e82cbb816f5da4d8a9b2f06eb3375b72b')

prepare() {
  # Prefix replacement
  for row in $(jq -c '.paths[] | select(has("prefix_placeholder"))' "info/paths.json"); do
    path=$(echo $row | jq -r '._path')
    prefix=$(echo $row | jq -r '.prefix_placeholder')
    sed -i "s:${prefix}:/usr:g" "${path}"
  done
}

package() {
    mkdir -p "${pkgdir}/usr/"
    cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/"
    install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
}
