# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-helpers-namespace
pkgname=python-pytest-helpers-namespace
pkgver=2021.12.29
pkgrel=1
pkgdesc="PyTest Helpers Namespace"
arch=(any)
url="https://github.com/saltstack/pytest-helpers-namespace"
license=(Apache)
depends=(python-pytest)
makedepends=(git python-setuptools-declarative-requirements python-setuptools-scm python-toml)
checkdepends=(python-pytest)
source=("git+https://github.com/saltstack/pytest-helpers-namespace#tag=v${pkgver}?signed")
sha512sums=('SKIP')
validpgpkeys=('D2908FB3A823B0FAB3BD21F5BB36BF6584A298FF') # Pedro Algarvio (s0undt3ch) <pedro@algarvio.me>

build() {
  cd "${_name}"
  python setup.py build
}

check() {
  cd "${_name}"
  # installing into test location, so pytest can pick up the extension
  mkdir -vp test_dir
  python setup.py install --optimize=1 --root="test_dir"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="test_dir/${site_packages}:${PYTHONPATH}"
  pytest -vv
}

package() {
  cd "${_name}"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -vDm 644 {AUTHORS,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
