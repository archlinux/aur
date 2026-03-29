# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=pardf
pkgver=1.8.2
pkgrel=2
pkgdesc="Word-Sys's PDF Editor"
url="https://github.com/word-sys/pardf"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('hicolor-icon-theme' 'python-gobject' 'python-pymupdf' 'python-numpy')
optdepends=('libreoffice-fresh: export document to format .docx')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/word-sys/${pkgname}/archive/${pkgver}.tar.gz"
        "pyproject.toml"
        "setup.cfg"
        "${pkgname}.desktop"
        "icon_path.patch"
        "license_path.patch")
sha256sums=('5abc6837250e0f65f58a36d840e691201af3c33454de5731e305ac51898b882e'
            '8ac8a3cc7e24bc7c4a5a3e763c2fce23087c6a33a3457e68978703523eca366d'
            'ea1e68078968c7b293e4bb0e3c7ad345fafbec70f927c85680f9137bb5582dd0'
            '2423b64045e1ec217b9f9b942874a325422f3c927807d907e2bbd07ffbff3e29'
            '9274af2f7007250349f687dade43c590d41380cdeb5b0bf3382369a1c7c79d12'
            '6d85adc780d932176a80f98beba133fa44e2c5be9d1a1fb57326f41501e6dc3f')

prepare() {
  cd "${pkgname}-${pkgver}"
  install -m 644 "${srcdir}/pyproject.toml" .
  install -m 644 "${srcdir}/setup.cfg" .
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
  install -m 644 -D "icon256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -m 644 -D "icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  install -m 644 -D "icon256.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}

