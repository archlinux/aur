# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=word-sys-pdf-editor
pkgver=1.9.2
pkgrel=1
pkgdesc="A simple and user-friendly PDF Editor"
url="https://github.com/word-sys/word-sys-pdf-editor"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('gtk4' 'hicolor-icon-theme' 'libadwaita'
         'python-cairo' 'python-gobject' 'python-pymupdf' 'python-numpy')
optdepends=('libreoffice-fresh: export document to format .docx')
conflicts=('pardf' 'fospx-pdf-editor')
replaces=('pardf' 'fospx-pdf-editor')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/word-sys/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "icon_path.patch"
        "license_path.patch")
sha256sums=('46cde6508c61c6d09a582a9731a6a3912769b602d8b17a1c93c8f5589c996f4f'
            '1d052114e538cb93da18668b2d4ac75c182619e72c9855ab3e849299540b76ad'
            '3a78a40aacf794bcd9564a79c917b2cdf6887ef478bf0992c3920a582550818d'
            '9f5f66c2ba5c32c186851e8a78b5a204cc19c23e032383a81263c1be3cb9f299')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Install patches
  patch -p1 -i "${srcdir}/icon_path.patch"
  patch -p1 -i "${srcdir}/license_path.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # Install application launcher into /usr/share/applications
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
  # Install icons into /usr/share/icons/hicolor
  cd "word_sys_pdf_editor/img"
  install -m 644 -D "f-pv1.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -m 644 -D "f-pv1.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}

