# Maintainer: JakobDev<jakobdev at gmx dot de>

pkgname=python-appstream-python
pkgver=0.9.0
pkgrel=1
pkgdesc="A Python library for dealing with Freedesktop Appstream data"
arch=("any")
url="https://codeberg.org/JakobDev/appstream-python"
license=("BSD")
depends=("python" "python-requests" "python-lxml")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel" "python-sphinx" "python-sphinx_rtd_theme" "make")
checkdepends=("python-pytest" "python-pytest-cov" "python-pytest-subtests" "python-requests-mock")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/appstream-python/archive/${pkgver}.tar.gz")
sha512sums=("c0c290687b07144c724f20f82ed7ef6a287656fc241706a084cc1fdffd2831d35dd8521da9a7c5e0f2c62d738c9518f3d4fa09179965628b146020eae7776100")

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
