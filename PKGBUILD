# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pamela
pkgver=1.2.0
pkgrel=2
pkgdesc="Python PAM interface"
arch=('any')
url="https://github.com/jupyterhub/pamela"
license=('MIT')

depends=(
  'pam'
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
  'python-pytest'
)

source=(
  "git+https://github.com/jupyterhub/pamela.git#tag=${pkgver}"
)
sha256sums=(
  'db14dd4aa133b71025030b9428a9de2b4d9002935ae740d86bef7537585588c6'
)

build() {
  cd pamela
  python -m build --no-isolation --wheel
}

check() {
  cd pamela
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer "dist/pamela-${pkgver}"*.whl
  test-env/bin/python -m pytest
}

package() {
  cd pamela
  python -m installer --destdir="${pkgdir}" "dist/pamela-${pkgver}"*.whl
  install -m644 -D -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
