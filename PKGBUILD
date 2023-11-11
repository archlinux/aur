# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=holoviews
pkgname=python-${_base}
pkgver=1.18.1
pkgrel=1
pkgdesc="With Holoviews, your data visualizes itself"
arch=(any)
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-panel python-colorcet)
makedepends=(python-build python-installer python-wheel)
optdepends=('jupyter-nbconvert: for use holoviews command')
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('13c99b5a868dfcd92a5291c62890e0d74fe4241e7c44e41cf85a63f52487c77608d882c4c71f4d653199e92155eabf1f8a3d54ba6b69d7a461ee3d458ae5861e')

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
}
