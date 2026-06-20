# Maintainer: Alexander Jacocks <alexander@redhat.com>

_pkgname="ansible_dev_environment"
pkgname="ansible-dev-environment"
pkgver=26.4.0
pkgrel=1
pkgdesc="A pip-like install for ansible collections."
arch=('x86_64')
url="https://github.com/ansible/ansible-dev-environment"
license=('GPLv3')
depends=(python python-{jsonschema,onigurumacffi} ansible-{core,runner} git)
makedepends=(python-{build,installer,pip,setuptools,setuptools-scm,wheel})
checkdepends=('python-pytest')
optdepends=('ansible: check official ansible collections')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('94543fe12892bb6f811e1a689d183154aa9aa47409d55e8afaf0c829c3e6988a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # workaround unavailability of setuptools-scm<10.0
  sed -i 's/setuptools_scm\[simple\].*/setuptools_scm[simple] >= 8.4",  # required for "no-local-version" scheme/' pyproject.toml

  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" ${srcdir}/${pkgname}-${pkgver}/dist/*.whl
}
