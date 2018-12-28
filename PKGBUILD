pkgname=hotshots-git
pkgver=e3b04ef
pkgrel=1
pkgdesc="Screenshot tool with some editing features."
url="http://thehive.xbee.net"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('qt5-base' 'qt5-x11extras' 'shared-mime-info')
makedepends=('cmake')
source=('git://github.com/obiwankennedy/HotShots.git'
        'qt511.patch')
sha256sums=('SKIP'
            'f25246aa323ed5a190f99d23eb934fcd9ba9e11e5513fd4a5c9f507d6bd6e011')

prepare() {
    cd "${srcdir}/HotShots"
    patch -p1 -i ../qt511.patch
}

build() {
    cd "${srcdir}/HotShots/"
    qmake
    make
    sed -i "s/\/usr\/local/\/usr/g" hotshots.desktop
}

package() {
    install -Dm755 "${srcdir}/HotShots/release/hotshots" "${pkgdir}/usr/bin/hotshots"
    install -Dm755 "${srcdir}/HotShots/hotshots.desktop" "${pkgdir}/usr/share/applications/hotshots.desktop"

    for file in `ls "${srcdir}/HotShots/lang/"`; do
	install -Dm644 "${srcdir}/HotShots/lang/$file" "${pkgdir}/usr/share/hotshots/locale/$file"
    done

    install -Dm644 "${srcdir}/HotShots/AUTHORS.txt" "${pkgdir}/usr/share/hotshots/AUTHORS.txt"
    install -Dm644 "${srcdir}/HotShots/Changelog.txt" "${pkgdir}/usr/share/hotshots/Changelog.txt"
    install -Dm644 "${srcdir}/HotShots/CREDITS.txt" "${pkgdir}/usr/share/hotshots/CREDITS.txt"
    install -Dm644 "${srcdir}/HotShots/README.txt" "${pkgdir}/usr/share/hotshots/README.txt"
    install -Dm644 "${srcdir}/HotShots/res/hotshots.png" "${pkgdir}/usr/share/pixmaps/hotshots.png"
    install -Dm644 "${srcdir}/HotShots/hotshots.1.gz" "${pkgdir}/usr/share/man/man1/hotshots.1.gz"
}

post_install() {
    update-desktop-database -q
}