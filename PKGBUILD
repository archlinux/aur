# Maintainer: Simon <simon dot hanna at serve-me dot info>
# Contributor: Garrett <floft.net/contact>

pkgname=openlp
pkgver=3.0.0
pkgrel=1
pkgdesc="Church presentation software."
arch=('any')
url='http://openlp.org/'
license=('GPLv2')
makedepends=('qt5-tools')
depends=('python>=3.10' 'python<3.11' 'python-pyqt5' 'phonon-qt5'
         'python-chardet' 'python-lxml' 'python-qrcode'
         'python-beautifulsoup4' 'python-pyenchant'
         'python-alembic' 'qt5-multimedia' 'qt5-webkit')

optdepends=('libreoffice-fresh: Display impress presentations'
            'vlc: Play multimedia'
            'mupdf: Display pdfs'
            'python-mysql-connector: Use a mysql/mariadb database'
            'python-psycopg2: Use a postgresql database')
install=openlp.install
source=("https://get.openlp.org/${pkgver}/OpenLP-${pkgver}.tar.gz" "openlp.sh")
sha256sums=('6c28bfda7896b9f5fe8346def1f318d0111b005fc81b0aa6c2bee1c366d5a6e4'
            '19c2f3c622585bf308efc259013fb5518feaf8cf14b51613e1e71778fcc2e8cf')

package() {
  cd "${srcdir}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  #remove tests
  rm -rf "${pkgdir}/usr/lib/python3.10/site-packages/tests"

  echo "${pkgver}" > "${pkgdir}/usr/lib/python3.10/site-packages/openlp/.version"

  install -Dm0755 "${srcdir}/openlp.sh" "${pkgdir}/etc/profile.d/openlp.sh"
  install -Dm0644 "resources/openlp.desktop" "${pkgdir}/usr/share/applications/openlp.desktop"
  install -Dm0644 "resources/images/openlp-logo.svg" "${pkgdir}/usr/share/pixmaps/openlp.svg"
  install -Dm0644 "resources/images/openlp-logo-48x48.png" "${pkgdir}/usr/share/pixmaps/openlp.png"

  #translations
  tsrcdir="${srcdir}/resources/i18n"
  tdestdir="${pkgdir}/usr/share/$pkgname/i18n"
  mkdir -p "${tdestdir}"
  cd "${tsrcdir}"
  
  for file in *.ts; do
    lconvert -i "${file}" -o "${tdestdir}/${file%%ts}qm"
  done
}
