# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=npx
pkgname=python-${_base}
pkgdesc="Some useful extensions for NumPy"
pkgver=0.0.17
pkgrel=1
arch=('x86_64')
url="https://github.com/nschloe/${_base}"
license=('custom')
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-tox)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9cbba63aa426ed216e8a679efb2986951419166339ca1eb090945d790a236b189f6334c52bb7eb6f4e1c6d87f357bfc8dcf1407e6b1205babfb58377718477aa')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  tox -e py$(python -c "import sys; print(sys.version[:3].replace('.', ''))")
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -c "from setuptools import setup; setup();" install --root="${pkgdir}" --optimize=1
  rm -r "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/${_base}/__pycache__"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
