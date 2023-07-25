# Maintainer: Jordan Cook <JCook83@gmail.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=requests-ratelimiter
pkgname=python-${_base}
pkgdesc="Rate-limiting for the requests library"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://github.com/JWCook/${_base}"
license=(MIT)
depends=(python-requests python-pyrate-limiter)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest python-requests-mock)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7fc9bb3f67b2637cf54d56114c62b8058212b3e33ab053c3acf91b081cce986b89367a2078615e163de500b8d5036e47291f6b155ead1064e0fbfbe2d8e9bf97')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest test -k 'not limiter_adapter'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base/-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
