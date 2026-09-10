# Maintainer: JakobDev<jakobdev at gmx dot de>

pkgname=python-appstream-python
pkgver=1.1.0
pkgrel=2
pkgdesc="A Python library for dealing with Freedesktop Appstream data"
arch=("any")
url="https://codeberg.org/JakobDev/appstream-python"
license=("BSD")
depends=("python" "python-requests" "python-lxml")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel" "python-sphinx" "python-sphinx-furo" "make")
checkdepends=("python-pytest" "python-pytest-cov" "python-requests-mock")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/appstream-python/archive/${pkgver}.tar.gz")
sha512sums=("5d62d9a652f07e9eb4100613fbff433ac6e8c1e58c68f407f87655e826ba0ed8a7e7f87904e6e391fe13f7bc7839d04b939e2f8d83e346f062b80e6b43f76519")

build() {
  cd "appstream-python"
  python -m build --wheel --no-isolation

  cd docs
  make man html
}

check() {
  cd "appstream-python"
  pytest
}

package() {
  cd "appstream-python"
  python -m installer --destdir "$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "docs/_build/man/appstream-python.1" -t "${pkgdir}/usr/share/man/man1"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs/_build/html/* "${pkgdir}/usr/share/doc/${pkgname}"
}
