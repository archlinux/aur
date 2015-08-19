# Contributor:  Bartosz Chmura <chmurli@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: alfplayer
# Contributor: menta

pkgname=retext
pkgver=5.0.2
_pkgverline=5.0
pkgrel=2
pkgdesc="A simple editor for Markdown and ReStructuredText markup languages"
arch=('any')
url="http://retext.sourceforge.net/"
license=('GPL3')
# for desktop integration: 'shared-mime-info' 'xdg-utils' 'desktop-file-utils'
# for toolbar icons (see http://sourceforge.net/p/retext/tickets/44/): 'gconf'
depends=('python-pyqt5' 'qt5-webkit' 'python-markups' 'shared-mime-info' 'xdg-utils' 'desktop-file-utils' 'gconf')
makedepends=('imagemagick')
optdepends=('python-markdown: for Markdown language support'
            'python-docutils: for reStructuredText language support'
            'python-pyenchant: for spell checking support')
source=("http://downloads.sourceforge.net/project/${pkgname}/ReText-${_pkgverline}/ReText-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "x-retext-markdown.xml"
        "x-retext-rst.xml")
install="${pkgname}".install
sha256sums=('SKIP'
            '7782f4402fe62e48335c1bdd5c1fd5cbb48c408fabaf4f018a074f8b3eef838e'
            'b51611479d3224eec2b58264ed91ace3eccb502b7b806dae3e7a3ab4aab8c4b8'
            '6fef80cccb14813d9cc74810c397a6cd7831d1ca243536759a47c6e8b6cc977a')


package () {
    cd "$srcdir/ReText-${pkgver}"
    python3 setup.py install --root="$pkgdir"

    # create /usr/share/* dirs
    _SHAREDIR="$pkgdir/usr/share"
    install -d -m 755 $_SHAREDIR/{applications,mime/packages}

    # install icons
    _ICONSDIR="$_SHAREDIR/icons/hicolor"
    for size in 16 22 24 32 48 128; do
      install -d -m 755 $_ICONSDIR/${size}x${size}/apps
      convert -resize $size icons/$pkgname.png $_ICONSDIR/${size}x${size}/apps/$pkgname.png
    done
    install -d -m 755 $_ICONSDIR/scalable/apps
    install -m 644 icons/$pkgname.svg $_ICONSDIR/scalable/apps/$pkgname.svg

    # install mime files
    install -m 644 $srcdir/x-retext-{markdown,rst}.xml $_SHAREDIR/mime/packages/

    # install desktop file
    install -m 644 $srcdir/$pkgname.desktop $_SHAREDIR/applications/$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
