# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=holoviews
pkgname=python-${_base}
pkgver=1.15.4
pkgrel=1
pkgdesc="With Holoviews, your data visualizes itself"
arch=(any)
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-pandas python-panel python-colorcet)
makedepends=(python-build python-installer)
optdepends=('jupyter-nbconvert: for use holoviews command')
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('7a9cf993762c7a4256da68de7171cb7dd00088b2a6a3fb1ec55a91336f5afdd4876914457d2d65ab86b4dad4e5b33c67270e500cd4c3ec97e10a7aada6ea9caf')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")"/${_base}/.version
}
