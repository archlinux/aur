# Maintainer: <getzze at gmail dot com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-asv'
_pkgname='asv'
pkgver=0.6.2
pkgrel=3
pkgdesc="A simple benchmarking tool with web-based reporting."
arch=('x86_64')
url="https://asv.readthedocs.io"
license=('BSD-3')
depends=('python-asv-runner' 'python-tabulate' 'python-virtualenv' 'python-tomli' 'python-json5')
checkdepends=('git' 'python-pip' 'python-pytest' 'python-selenium')
optdepends=()
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'cython')
source=("$pkgname-$pkgver.tar.gz::https://github.com/airspeed-velocity/asv/archive/v$pkgver.tar.gz")
sha256sums=('0e71d7642ba853913cd29d44d2b195bd19f979608fdd0b9b65b2b21c5fbf23f3')

prepare(){
  cd "${_pkgname}-${pkgver}"
  # Only include the source in the wheel, no test, docs, benchmarks
  sed -i -e '/\[tool.setuptools.packages.find\]/a \include = \[\"asv\"\]' pyproject.toml
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

  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/$site_packages:$PYTHONPATH" pytest "${test_folder}"
}

package(){
  cd "${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}

# vim:ts=2:sw=2:et:
