# Maintainer: Murdi <murdialthaf848@gmail.com>
# Contributor: Murdi

pkgname=animaru
pkgver=0.1.0
pkgrel=1
pkgdesc="A GTK4 GUI for watching and downloading anime"
arch=('any')
url="https://github.com/murdialthaf/animaru"
license=('GPL3')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'mpv'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-pip'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/murdialthaf/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # anipy-api is on PyPI but not yet in the AUR.
  # It will be pulled via pip during the build.
  python -m venv --system-site-packages _pydeps
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  source _pydeps/bin/activate
  pip install --no-deps anipy-api
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  source _pydeps/bin/activate
  pip install --no-deps --root="${pkgdir}" --prefix=/usr anipy-api

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 data/animaru.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 data/icons/animaru.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
