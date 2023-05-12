# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-numexpr-mkl-bin
_pkgname=numexpr
_pkgver=2.8.4
_build=py311h65dcdc2_1
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
pkgdesc="Fast numerical array expression evaluator for Python - with Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="https://github.com/pydata/numexpr"
license=('MIT')
provides=('python-numexpr')
conflicts=('python-numexpr')
depends=('python-mkl-service' 'python-numpy')
makedepends=('jq')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2")
sha256sums=('1f1b5b1a2937992e42f60be1b487fc7d635fdc9c08eed7e7dfb7ba8f2ecd503d')

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
