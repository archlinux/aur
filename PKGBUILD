# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-numpy-mkl-bin
_pkgname=numpy-base
_pkgver=1.23.5
_build=py310h8e6c178_0
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
pkgdesc="Scientific tools for Python - with Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://www.numpy.org/"
license=('custom')
provides=('python-numpy' 'python-numpy-mkl')
conflicts=('python-numpy')
depends=('python-mkl-service')
makedepends=('jq')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('e19b98aa257335a363b2366e5dbd4c981a1ded11a7be0b3ebeb6aca7d263bbe9')

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
