# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=pytest-selenium
pkgname=python-${_base}
pkgver=4.0.0
pkgrel=1
pkgdesc="pytest plugin for Selenium"
arch=(any)
url="https://github.com/pytest-dev/${_base}"
license=(MPL2)
depends=(python-pytest-base-url python-pytest-html python-pytest-variables python-selenium python-tenacity)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest-localserver python-pytest-xdist python-pytest-mock chromedriver) # geckodriver
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9984109b5fecfced94485ec3b69e6ac57214b1a4c19c58c536743b81cee231d05f7be5257ba2055162b31d641e63814fe9e6f05821e531cb4c53c8495eb0b462')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest testing -k 'not launch and not args and not driver_quit and not xdist and not driver_log_fixture and not launch_case_insensitive and not profile and not preferences_marker and not capture_debug_env[always] and not capture_debug_env[failure] and not capture_debug_config[always] and not capture_debug_config[failure] and not exclude_debug_env[url] and not exclude_debug_env[screenshot] and not exclude_debug_env[html] and not exclude_debug_env[logs] and not exclude_debug_config[url] and not exclude_debug_config[screenshot] and not exclude_debug_config[html] and not exclude_debug_config[logs] and not event_listening_webdriver'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
