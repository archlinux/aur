# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-mkl-random-bin
_pkgname=mkl_random
_pkgver=1.2.2
_build=py310h00e6091_0
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=3
epoch=1
pkgdesc="Sampling probability distributions using Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/IntelPython/mkl_random"
license=('custom')
provides=('python-mkl-random')
conflicts=('python-mkl-random')
depends=('python-mkl-service' 'python-numpy')
makedepends=('jq')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('8a0e862e81fd6dd43d5c4f683f50ba06d2a8a58686640b914104fe68dd84fc6b')

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
