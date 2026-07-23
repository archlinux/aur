# Maintainer: Murdi <murdialthaf848@gmail.com>

pkgname=animaru
pkgver=0.1.0
pkgrel=2
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
  python -m venv --system-site-packages _pydeps
  source _pydeps/bin/activate
  pip install anipy-api
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  source _pydeps/bin/activate
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python_ver=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")

  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Bundle anipy-api and its dependencies (not yet in AUR)
  site_pkgs="${pkgdir}/usr/lib/python${python_ver}/site-packages"
  mkdir -p "$site_pkgs"
  cp -r _pydeps/lib/python${python_ver}/site-packages/* "$site_pkgs/"

  install -Dm644 data/animaru.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 data/icons/animaru.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
