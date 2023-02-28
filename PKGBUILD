# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-scipy-mkl-bin
_pkgname=scipy
_pkgver=1.10.0
_build=py310hd5efca6_1
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
pkgdesc="SciPy is open-source software for mathematics, science, and engineering - with Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="http://www.scipy.org/"
license=('custom')
provides=('python-scipy' 'python-scipy-mkl')
conflicts=('python-scipy')
depends=('python-numpy' 'python-mkl-service')
makedepends=('jq')

optdepends=('python-pillow: for image saving module')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('8d5b16cf7905eb7c169509e6b88f6a7c75ff213ef8f366491f8fdafbac690c5f')

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
