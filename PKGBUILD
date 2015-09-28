# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Bartosz Chmura <chmurli@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: alfplayer
# Contributor: menta

pkgname=retext
pkgver=5.2.0
pkgrel=1
pkgdesc="A simple editor for Markdown and ReStructuredText markup languages"
arch=('any')
url="https://github.com/retext-project/retext"
license=('GPL3')
# for desktop integration: 'shared-mime-info' 'xdg-utils' 'desktop-file-utils'
# for toolbar icons (see http://sourceforge.net/p/retext/tickets/44/): 'gconf'
depends=('python-pyqt5' 'qt5-webkit' 'python-markups' 'shared-mime-info' 'xdg-utils' 'desktop-file-utils' 'gconf')
makedepends=('imagemagick')
optdepends=('python-markdown: for Markdown language support'
            'python-docutils: for reStructuredText language support'
            'python-pyenchant: for spell checking support')
source=("https://github.com/retext-project/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "x-retext-markdown.xml"
        "x-retext-rst.xml")
install="${pkgname}".install
sha256sums=('b42c027205d1c5c3d322892b400663f858ac7d3e9953027411c8c11cf51ca362'
            '7782f4402fe62e48335c1bdd5c1fd5cbb48c408fabaf4f018a074f8b3eef838e'
            'b51611479d3224eec2b58264ed91ace3eccb502b7b806dae3e7a3ab4aab8c4b8'
            '6fef80cccb14813d9cc74810c397a6cd7831d1ca243536759a47c6e8b6cc977a')


package () {
    cd "$srcdir/retext-${pkgver}"
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
