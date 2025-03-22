# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name="pytest-pyodide"
pkgname="python-${_name}"
pkgver=0.58.4
_pyodide_pkgver=0.26.1
pkgrel=1
pkgdesc="Pytest plugin for testing applications that use Pyodide."
arch=('any')
url="https://github.com/pyodide/pytest-pyodide"
license=('MPL-2.0')
depends=('python>=3.10' 'python-pexpect' 'python-pytest' 'python-pytest-asyncio' 'python-hypothesis' 'python-selenium' 'selenium-manager' 'python-playwright' 'python-tblib')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-cov' 'python-build' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz"
        "https://github.com/pyodide/pyodide/releases/download/${_pyodide_pkgver}/pyodide-${_pyodide_pkgver}.tar.bz2")
sha256sums=('653f460e514cae6038cee821c592b05a0a2a4a22dab77929603126921f7d70f1'
            '1bd2487795c4628272e3295a47f2da749682cd59a3680c5acfcd69baf3bb19b0')

prepare(){
  cp -r "${srcdir}"/pyodide "${srcdir}"/${_name//-/_}-${pkgver}/pyodide
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  sed -i 's/requires = \["hatchling", "hatch-vcs"\]/requires = ["hatchling"]/' pyproject.toml
  # Disable pretty pluging in pytest
  sed -i 's/\(runpytest([^)]*\)/\1, "-p no:pretty"/' tests/test_options.py
  sed -i 's/runpytest(, "-p no:pretty"/runpytest("-p no:pretty", /' tests/test_options.py
}

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    -p no:flaky
    --deselect tests/test_decorator.py::test_hypothesis # Need pytest 7
    --deselect tests/test_doctest.py # Need pytest 7
    -k "not test_jspi" # the suspender attribute doesn't exist anymore
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/pip install "pyodide-py==${_pyodide_pkgver}"
  test-env/bin/pip install "tblib==3.0.0" # Need for test because the version provided by Arch maintainers is not compatible
  test-env/bin/python -m installer dist/*.whl
  #test-env/bin/python -m playwright install chrome --with-deps # Playwright isn't compatible with Arch Linux
  #test-env/bin/python -m playwright install chrome --with-deps # Playwright isn't compatible with Arch Linux
  for runtime in node chrome firefox; do
    test-env/bin/python -m pytest "${pytest_options[@]}" tests --runtime=${runtime}
  done
  # test-env/bin/python -m pytest "${pytest_options[@]}" tests --runner=playwright --runtime=chrome # Playwright isn't compatible with Arch Linux
  # test-env/bin/python -m pytest "${pytest_options[@]}" tests --runner=playwright --runtime=firefox # Playwright isn't compatible with Arch Linux
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
