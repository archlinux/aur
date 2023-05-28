# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=pytest-selenium
pkgname=python-${_base}
pkgver=4.0.1
pkgrel=1
pkgdesc="pytest plugin for Selenium"
arch=(any)
url="https://github.com/pytest-dev/${_base}"
license=(MPL2)
depends=(python-pytest-base-url python-pytest-html python-pytest-variables python-selenium python-tenacity)
makedepends=(python-build python-installer python-hatch-vcs)
checkdepends=(python-pytest-localserver python-pytest-xdist python-pytest-mock python-py chromedriver) # geckodriver
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('6347a365261596ee88c733e8acb06c9a94efc9f1c391ac153977a030623a0d741c6d08fc1f348c2b5466d3f875a52ebca32deec2421ed3ea53b81d6896ef36c9')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
