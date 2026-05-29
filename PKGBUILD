# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=qpdfview
pkgname="${_pkgname}-git"
pkgver=0.5.r24.gc61eb650
pkgrel=1
pkgdesc="A tabbed PDF viewer using the poppler library"
url="https://launchpad.net/qpdfview"
arch=('x86_64' 'aarch64')
license=(GPL-2.0-or-later)
provides=($_pkgname $_pkgname-bzr)
conflicts=($_pkgname $_pkgname-bzr)
depends=(libcups libsynctex poppler-qt6 qt6-svg)
makedepends=(git qt6-tools libspectre djvulibre breezy)
optdepends=('libspectre: PostScript support'
            'djvulibre: DjVu support')
source=("git+https://git.launchpad.net/qpdfview"
        'bump-c++-version.patch')
b2sums=('SKIP'
        'dedd0f2070fc60fdd50ab4f81ef54394721abfbdb7426e17850703dc3c52bfcc38c323bf64aab3c69f84bf541ba000ec4236a475c1d2beed13d49f54b0baedda')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's|^qpdfview-||;s|-|.r|;s|-|.|'
}

prepare() {
    cd "$_pkgname"
    for p in "${srcdir}"/*.patch
    do
        echo "Applying patch $(basename "${srcdir}"/${p})"
        patch -p1 -i "${p}"
    done
}

build() {
    cd "$_pkgname"
    /usr/lib/qt6/bin/lrelease qpdfview.pro
    qmake6 qpdfview.pro
    make
}

package() {
    cd "$_pkgname"
    make INSTALL_ROOT="$pkgdir" install
}
