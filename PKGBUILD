# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_pkgname=BeeRef
pkgname=${_pkgname,,}
pkgver=0.3.1
pkgrel=1
pkgdesc="Reference Image Viewer"
arch=('any')
url="https://github.com/mini-ninja-64/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme' 'python-exif' 'python-pyqt6' 'python-rectangle-packer')
makedepends=('python-build' 'python-installer' 'python-pdm' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('da5dee97e5839198fe89178090379d0f89b58d48d317312a5a46649899649b3bb33c6c2eed84908084b70be9838593654a01ba271c10a92dc64237f1bdab8ffe')

_xdg_desktop_name=org.${pkgname}.${_pkgname}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i "s/Comment=.*/Comment=Reference Image Viewer/" ${pkgname}.desktop
  sed -i "s/Exec=.*/Exec=${pkgname}/" ${pkgname}.desktop
  sed -i "s/Icon=.*/Icon=${_xdg_desktop_name}/" ${pkgname}.desktop
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 beeref.desktop \
                  "${pkgdir}/usr/share/applications/${_xdg_desktop_name}.desktop"

  install -Dm 644 "${pkgname}/assets/logo.svg" \
                  "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_xdg_desktop_name}.svg"

  install -Dm 644 "${pkgname}/assets/logo.png" \
                  "${pkgdir}/usr/share/icons/hicolor/400x400/apps/${_xdg_desktop_name}.png"
}
