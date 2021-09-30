# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=colour-science
pkgname=python-${_base}
pkgdesc="Colour Science for Python"
pkgver=0.3.16
pkgrel=1
arch=('x86_64')
url="https://www.${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-imageio python-scipy python-six) # graphviz boost openexr libpng libtiff
makedepends=(python-setuptools)
checkdepends=(python-pytest python-networkx)
source=(https://github.com/${_base}/${_base//-science/}/archive/v${pkgver}.tar.gz)
sha512sums=('64b0ac7f8bc80068157885030c54168c6987a09b93ce95a1c33a8fb7807ce262fb269c88d20f5f31c39761a66b50c1a853893fd8ee8b7d5f12f496d7c6e2d6f2')

build() {
  cd "${_base//-science/}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base//-science/}-${pkgver}"
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  MPLBACKEND=Agg PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest -k 'not nan_matrix_colour_correction_Cheung2004 and not nan_matrix_colour_correction_Finlayson2015 and not nan_matrix_colour_correction_Vandermonde and not nan_colour_correction_Cheung2004 and not nan_colour_correction_Finlayson2015 and not nan_colour_correction_Vandermonde and not read_image_Imageio and not write_image_Imageio and not read_image and not write_image' --ignore=${_base//-science/}/graph/tests ${_base//-science/}
}

package() {
  cd "${_base//-science/}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
