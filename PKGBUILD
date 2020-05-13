# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# Contributor: Narrat <autumn-wind at web dot de>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgname=leo
pkgver=6.2.1
pkgrel=1
pkgdesc="Outliner, Editor, and Personal Information Manager written in 100% Python"
arch=('any')
url="http://leoeditor.com"
license=('MIT' 'BSD')
depends=('desktop-file-utils'
         'shared-mime-info'
         'python-pyqt5'
         'python-pyqtwebengine'
         'python-docutils'
         'python-flexx'
         'python-meta'
         'jupyter-nbformat'
         'python-pylint'
         'python-pyflakes'
         'python-pyshortcuts'
         'python-sphinx'
         'python-black'
         'python-asttokens')
makedepends=('python-setuptools' 'gendesk')
optdepends=('python-pyenchant: spellchecking support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leo-editor/leo-editor/archive/v${pkgver}.tar.gz"
        'setup.py.patch'
        'leo.xml')
sha256sums=('95ae6334e1c1ead096bae7695c1c0a0b8c6992a83ea6c88166f94dd750fc68ae'
            'SKIP'
            'SKIP')

prepare() {
    cd "${pkgname}-editor-${pkgver}"
    patch -Np1 -i ../setup.py.patch
}

build() {
    cd "${pkgname}-editor-${pkgver}"
    python setup.py build
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
     --mimetypes=application/x-leo-outline --exec="$pkgname" \
      --categories=TextEditor\;Development --icon "$pkgname"
}

package() {
    cd "${pkgname}-editor-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 leo.desktop "${pkgdir}/usr/share/applications/leo.desktop"
    install -Dm644 "$srcdir/leo.xml" "${pkgdir}/usr/share/mime/packages/leo.xml"
    install -Dm644 "leo/Icons/application-x-leo-outline.png" "${pkgdir}/usr/share/pixmaps/leo.png"
}