# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Markus Kaiser <markus dot kaiser at in dot tum dot de>
_base=holoviews
pkgname=python-${_base}
pkgver=1.18.2
pkgrel=1
pkgdesc="With Holoviews, your data visualizes itself"
arch=(any)
url="https://${_base}.org"
license=('custom:BSD-3-clause')
depends=(python-panel python-colorcet)
makedepends=(python-build python-installer python-wheel)
optdepends=('jupyter-nbconvert: for use holoviews command')
source=(${_base}-${pkgver}.tar.gz::https://github.com/holoviz/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('7c05e3686c30a3710b8a08837e32262c81264d63acea4503bd8a163adb983b81a466d7dcec22f35abc19439c8a807d1ef1fe7a69abdc74e8eeb65ced536c4987')

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
