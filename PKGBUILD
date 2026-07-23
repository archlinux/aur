# Maintainer Max Harmathy <harmathy@alumni.tum.de>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=gtimelog
pkgver=0.12.0
pkgrel=2
pkgdesc='Small GTK+ app for keeping track of your time'
arch=('any')
url='https://gtimelog.org/'
license=('GPL-2.0-only')
depends=(
  glib2
  gtk3
  gtk4
  hicolor-icon-theme
  libsecret
  libsoup3
  pango
  python
  python-freezegun
  python-gobject
)
makedepends=(
  python-build
  python-docutils
  python-installer
  python-setuptools
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('8eccde32fb11f2dd3a7e28d14693dea5052b9922aacef14235232e109be236ab')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
  
  # Generate man page
  rst2man gtimelog.rst > gtimelog.1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install .desktop file and icon(s)
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "src/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "src/${pkgname}/${pkgname}-large.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  # Install man page
  install -Dm644 "gtimelog.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  # Install additional documentation
  install -Dm644 "CHANGES.rst" "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.rst"
  install -Dm644 "CONTRIBUTING.rst" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.rst"
  install -Dm644 "CONTRIBUTORS.rst" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTORS.rst"
  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 "TODO.rst" "${pkgdir}/usr/share/doc/${pkgname}/TODO.rst"
}
