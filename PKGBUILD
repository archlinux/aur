# Maintainer: <getzze at gmail dot com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-asv'
_pkgname='asv'
pkgver=0.6.4
pkgrel=4
pkgdesc="A simple benchmarking tool with web-based reporting."
arch=('x86_64')
url="https://asv.readthedocs.io"
license=('BSD-3')
depends=('python-asv-runner' 'python-tabulate' 'python-virtualenv' 'python-json5' 'python-build')
checkdepends=(
  'git'
  'python-pip'
  'python-pytest'
  'python-pytest-xdist'
  'python-pytest-rerunfailures'
  'python-selenium'
  'python-pytest-timeout'
  'python-flaky'
)
optdepends=()
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-installer' 'python-wheel' 'cython')
source=("$pkgname-$pkgver.tar.gz::https://github.com/airspeed-velocity/asv/archive/v$pkgver.tar.gz")
sha256sums=('f7109ce440d69353148142e0696cc06fe6db3f8c34afa4ba2b57c032dd3ca5c9')

prepare(){
  cd "${_pkgname}-${pkgver}"
  # Only include the source in the wheel, no test, docs, benchmarks
#  sed -i -e '/\[tool.setuptools\]/a \package-dir = \{\"asv\" = \"asv\"\}' pyproject.toml
  sed -i 's/recursive-include asv /recursive-include asv *.json /' MANIFEST.in
}

build(){
  cd "${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --no-isolation
}


check(){
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${_pkgname}-${pkgver}"
  # Test are not in the wheel
  local test_folder="$PWD/test"
  local pytest_opts='--ignore=../test/test_environment.py -n auto'

  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/$site_packages:$PYTHONPATH" pytest ${pytest_opts} "${test_folder}"
}

package(){
  cd "${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"

  # Remove test, docs and benchmarks
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  find "${pkgdir}$site_packages"  -mindepth 1 -maxdepth 1 -type d \( ! -name "asv*" \) -exec rm -rf {} \;
}

# vim:ts=2:sw=2:et:
