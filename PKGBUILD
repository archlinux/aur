# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=fospx-pdf-editor
pkgver=1.8.3
pkgrel=1
pkgdesc="A simple and user-friendly PDF Editor"
url="https://github.com/fospx-org/fospx-pdf-editor"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('hicolor-icon-theme' 'python-gobject' 'python-pymupdf' 'python-numpy')
optdepends=('libreoffice-fresh: export document to format .docx')
conflicts=('pardf')
replaces=('pardf')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/fospx-org/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "icon_path.patch"
        "license_path.patch")
sha256sums=('08fc854841370fbd176590f828b34410ed3d46e4096c27ad7233a72ae5ebf295'
            'd3d985a7408ff5594e2dc4cd044ab295bc53c22accdc4b6cca78dbe3063f9c51'
            'd0adfb3c8c4aaafc58a393fd88540ff56ffe8ece5a3dc8869a656eb519db543d'
            'ae48f512c74fb7d1f7550a849716e2897fd4d6c8454253481e307f37e676cd3e')

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
  cd "fospx_pdf_editor/img"
  install -m 644 -D "icon256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -m 644 -D "icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  install -m 644 -D "icon256.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}

