# Maintainer: Simon <simon dot hanna at serve-me dot info>
# Contributor: Garrett <floft.net/contact>
# Contributor: Macxcool <macx coool at coolnet dot xyz>

pkgname=openlp
pkgver=3.1.1
pkgrel=1
pkgdesc="Church presentation software."
arch=('any')
url='http://openlp.org/'
license=('GPLv2')
makedepends=('qt5-tools' 'python-pip' 'python-setuptools')
depends=('python>=3.10' 'python<3.12' 'python-pyqt5' 'phonon-qt5'
        'python-chardet' 'python-lxml' 'python-beautifulsoup4' 'python-pyenchant' 
        'python-mako' 'python-appdirs' 'python-pyodbc' 
        'python-pyqt5-webengine' 'qt5-multimedia' 'python-pyqt5-webengine' 'python-alembic' 
        'python-qtawesome' 'python-websockets' 'python-flask' 'python-flask-cors' 
        'python-webob' 'python-waitress' 'python-qrcode' 'python-pymediainfo')

optdepends=('libreoffice-fresh: Display impress presentations'
            'python-vlc: Multimedia playback'
            'python-mysql-connector: Use a mysql/mariadb database'
            'python-psycopg2: Use a postgresql database')
install=openlp.install
source=("https://gitlab.com/openlp/openlp/-/archive/${pkgver}/openlp-${pkgver}.tar.gz" "openlp.sh")

sha256sums=('c464669a3661b3b23e917cb1508c1bfc8e8c8308ee24c86e7dde94789ea1797c'
            '19c2f3c622585bf308efc259013fb5518feaf8cf14b51613e1e71778fcc2e8cf')

package() {
    cd "${srcdir}/openlp-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1

    #remove tests
    pyVer=$(python --version | cut -d ' ' -f 2 | grep -Eo '[0-9]\.[0-9]+')
    rm -rf "${pkgdir}/usr/lib/python${pyVer}/site-packages/tests"

    echo "${pkgver}" > "${pkgdir}/usr/lib/python${pyVer}/site-packages/openlp/.version"

    install -Dm0755 "${srcdir}/openlp.sh" "${pkgdir}/etc/profile.d/openlp.sh"
    install -Dm0644 "resources/openlp.desktop" "${pkgdir}/usr/share/applications/openlp.desktop"
    install -Dm0644 "resources/images/openlp-logo.svg" "${pkgdir}/usr/share/pixmaps/openlp.svg"
    install -Dm0644 "resources/images/openlp-logo-48x48.png" "${pkgdir}/usr/share/pixmaps/openlp.png"

    #translations
    tsrcdir="${srcdir}/openlp-${pkgver}/resources/i18n"
    tdestdir="${pkgdir}/usr/share/$pkgname/i18n"
    mkdir -p "${tdestdir}"
    cd "${tsrcdir}"

    for file in *.ts; do
        lconvert -i "${file}" -o "${tdestdir}/${file%%ts}qm"
    done
}
