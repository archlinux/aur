pkgname=python-newrelic
pkgver=13.5.0
pkgrel=1
pkgdesc='New Relic Python agent'
arch=('x86_64')
url='https://github.com/newrelic/newrelic-python-agent'
license=('Apache-2.0')

depends=(
  'glibc'
  'python'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)

optdepends=(
  'python-certifi: certificate bundle support'
  'python-grpcio: infinite tracing support'
  'python-protobuf: infinite tracing support'
)

source=("https://files.pythonhosted.org/packages/source/n/newrelic/newrelic-${pkgver}.tar.gz")
sha256sums=('d48a1e29a51fe93ca3ac723bff564ce2c6abb319f884b815c069c3083db4ee6a')

prepare() {
  cd "newrelic-${pkgver}"
  sed -i 's/setuptools_scm>=6\.4,<10/setuptools_scm>=6.4/g' pyproject.toml setup.py
}

build() {
  cd "newrelic-${pkgver}"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
    NEW_RELIC_EXTENSIONS=on \
    python -m build --wheel --no-isolation
}

package() {
  cd "newrelic-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
