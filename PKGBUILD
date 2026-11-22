# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=word-sys-pdf-editor
pkgver=1.12.1
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
        "icon_path.patch")
sha256sums=('93c0db4e962d4a1e875ed823c16658df2709fa74af1dddd16f73c250b67e9204'
            '1d052114e538cb93da18668b2d4ac75c182619e72c9855ab3e849299540b76ad'
            'fdd48ac6e15c11774748766a52f2d4762598364ca2d60df7078ee3da9c0e0c66')

prepare() {
  cd "${pkgname}-${pkgver}"
  # Install patches
  patch -p1 -i "${srcdir}/icon_path.patch"
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

