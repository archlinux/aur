# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gaël Donval <gdonval+aur at google mail>
_base=pytest-selenium
pkgname=python-${_base}
pkgver=2.0.1
pkgrel=2
pkgdesc="Plugin for running Selenium with pytest"
arch=('any')
url="https://github.com/pytest-dev/${_base}"
license=(MPL2)
depends=(python-pytest-base-url python-pytest-html python-pytest-variables python-selenium python-tenacity)
makedepends=(python-setuptools-scm git)
checkdepends=(python-pytest-localserver python-pytest-xdist python-pytest-mock) # geckodriver chromedriver
source=("git+${url}.git?#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd "${_base}"
  python setup.py build
}

check() {
  cd "${_base}"
  python setup.py install --root="${PWD}/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python -m pytest testing -k 'not test_chrome and not test_driver and not test_firefox and not test_report and not test_safari and not invalid_host and not event_listening_webdriver'
}

package() {
  cd "${_base}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
