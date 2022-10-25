# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=pytest-selenium
pkgname=python-${_base}
pkgver=3.0.0
pkgrel=1
pkgdesc="pytest plugin for Selenium"
arch=(any)
url="https://github.com/pytest-dev/${_base}"
license=(MPL2)
depends=(python-pytest-base-url python-pytest-html python-pytest-variables python-selenium python-tenacity)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest-localserver python-pytest-xdist python-pytest-mock chromedriver) # geckodriver
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ce7d8e21974cbf6ee984189e86e5aa7127c2112f8f2469f10bfc2e18d62f490b21ab1fdf0514a9a79643d286e72eea23b53e819329d27f407f5844c7a1941665')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest testing -k 'not testingbot and not browserstack and not launch and not args and not driver_quit and not xdist and not driver_log_fixture and not launch_case_insensitive and not profile and not profile_with_preferences and not preferences_marker and not capture_debug_env[always] and not capture_debug_env[failure] and not capture_debug_config[always] and not capture_debug_config[failure] and not exclude_debug_env[url] and not exclude_debug_env[screenshot] and not exclude_debug_env[html] and not exclude_debug_env[logs] and not exclude_debug_config[url] and not exclude_debug_config[screenshot] and not exclude_debug_config[html] and not exclude_debug_config[logs] and not event_listening_webdriver'
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
