# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:  speps <speps at aur dot archlinux dot org>
# Contributor:  Anton Bazhenov <anton.bazhenov at gmail>
# Contributor:  Tuan Nguyen
# Contributor:  Farid <farid at archlinux-br dot org>

pkgname=pdfshuffler-git
_pkgname="pdfarranger"
pkgver=r143.d5c91b8
pkgrel=3
pkgdesc="Combine and modify PDF documents and thier pages. Python3, GTK3 version."
arch=('any')
url="http://sourceforge.net/projects/pdfshuffler/"
license=('GPL')
depends=('gtk3' 'python-gobject' 'python-distutils-extra' 'python-cairo'
         'poppler-glib' 'python-pypdf2' 'ghostscript')
makedepends=('git')
conflicts=('pdfshuffler')
source=("pdfshuffler-git::git+https://github.com/jeromerobert/$_pkgname")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package () {
    cd "$srcdir/$pkgname"
    python setup.py install --prefix=/usr --root="$pkgdir/"
    
    sed -i 's|Name=pdfarranger|Name=pdfshuffler|' "$pkgdir/usr/share/applications/$_pkgname.desktop"
    sed -i 's|Icon=pdfarranger|Icon=pdfshuffler|' "$pkgdir/usr/share/applications/$_pkgname.desktop"

    mv "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg" \
       "$pkgdir/usr/share/icons/hicolor/scalable/apps/pdfshuffler.svg"

    for _size in "16x16" "32x32" "48x48" "256x256" ; do
        mv "$pkgdir/usr/share/icons/hicolor/$_size/apps/$_pkgname.png" \
           "$pkgdir/usr/share/icons/hicolor/$_size/apps/pdfshuffler.png"
    done
}