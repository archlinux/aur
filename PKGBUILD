# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name='ccm'
pkgname=python-${_name}
pkgver=3.1.5
pkgrel=1
pkgdesc="Cassandra Cluster Manager."
url="http://github.com/pcmanus/ccm"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-pyyaml' 'python-six' 'python-psutil' 'apache-cassandra')
makedepends=('python-setuptools' 'python-pbr' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-mock' 'python-pytest' 'python-requests')
optdepends=('python-paramiko: Remote execution')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f07cc0a37116d2ce1b96c0d467f792668aa25835c73beb61639fa50a1954326c')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
