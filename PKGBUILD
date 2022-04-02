# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=requests-ratelimiter
pkgname=python-${_base}
pkgdesc="Rate-limiting for the requests library"
pkgver=0.2.1
pkgrel=1
arch=(any)
url="https://github.com/JWCook/${_base}"
license=(MIT)
depends=(python-requests python-pyrate-limiter)
makedepends=(python-build python-install python-poetry-core)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('adf3bd5331c15728fabac9f141771d4c9748337280c2f74e9deda6e0c2e4e434bdb8bdfe25870caac063c578c4d2084cf1ba7073a842756573b2b5d8008b96c5')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  test-env/bin/python -m pytest test
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base/-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
