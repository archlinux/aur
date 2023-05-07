# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=identinum
pkgdesc="Identify exact expression for decimal"
pkgver=0.7.1
pkgrel=2
arch=(any)
url="https://github.com/nschloe/${pkgname}"
license=(MIT)
depends=(python-sympy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0f99154955755c1a9cb1c815bdaa31ebd9eaec098f399566ebdbc6e75e85819e454b211cc35dbcab5c366129df75384e7fe7e5525e7391b4e171cb183dc21cad')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${pkgname}-${pkgver}.dist-info/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
