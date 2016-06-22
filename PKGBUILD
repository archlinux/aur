# Maintainer: MrPeacock
# Maintainer: Roberto Calabrese <robertocalabrese75@gmail.com>
pkgname=hotshots
pkgver=2.2.0
pkgrel=4
pkgdesc="Screenshot tool with some editing features."
url="http://thehive.xbee.net"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libqxt' 'shared-mime-info')
makedepends=('cmake')
source=("http://sourceforge.net/projects/hotshots/files/${pkgver}/HotShots-${pkgver}-src.zip"
	'fix_std_cmath.patch')
md5sums=('e36dcaaad8ab94adfff13e551adc053f'
         'b00ceebcb98d2495fa5431abcecf11ba')

prepare() {
    cd "${srcdir}/HotShots-${pkgver}-src"
    patch -p0 -i ../fix_std_cmath.patch
}

build() {
    cd "${srcdir}/HotShots-${pkgver}-src/src"
    sed -i "s/\/usr\/local\/share\/locale/\/usr\/share\/locale/g" MiscFunctions.cpp
    cd "${srcdir}/HotShots-${pkgver}-src/build"
    sed -i "s/\$1/\/usr/g" hotshots-desktop.sh
    sed -i "s/application/applications/g" HotShots.pro
    cmake CMakeLists.txt -DCMAKE_INSTALL_PREFIX:PATH="${srcdir}/HotShots-${pkgver}/usr"
    make
    make install
}

package() {
    install -Dm755 "${srcdir}/HotShots-${pkgver}/usr/bin/hotshots" "${pkgdir}/usr/bin/hotshots"
    install -Dm755 "${srcdir}/HotShots-${pkgver}/usr/share/applications/hotshots.desktop" "${pkgdir}/usr/share/applications/hotshots.desktop"

    for file in `ls "${srcdir}/HotShots-${pkgver}/usr/share/hotshots/locale"`; do
	install -Dm644 "${srcdir}/HotShots-${pkgver}/usr/share/hotshots/locale/$file" "${pkgdir}/usr/share/hotshots/locale/$file"
    done

    install -Dm644 "${srcdir}/HotShots-${pkgver}/usr/share/hotshots/AUTHORS.txt" "${pkgdir}/usr/share/hotshots/AUTHORS.txt"
    install -Dm644 "${srcdir}/HotShots-${pkgver}/usr/share/hotshots/Changelog.txt" "${pkgdir}/usr/share/hotshots/Changelog.txt"
    install -Dm644 "${srcdir}/HotShots-${pkgver}/usr/share/hotshots/CREDITS.txt" "${pkgdir}/usr/share/hotshots/CREDITS.txt"
    install -Dm644 "${srcdir}/HotShots-${pkgver}/usr/share/hotshots/README.txt" "${pkgdir}/usr/share/hotshots/README.txt"
    install -Dm644 "${srcdir}/HotShots-${pkgver}/usr/share/mime/packages/hotshots.xml" "${pkgdir}/usr/share/mime/packages/hotshots.xml"
    install -Dm644 "${srcdir}/HotShots-${pkgver}/usr/share/pixmaps/hotshots.png" "${pkgdir}/usr/share/pixmaps/hotshots.png"
    install -Dm644 "${srcdir}/HotShots-${pkgver}-src/build/hotshots.1.gz" "${pkgdir}/usr/share/man/man1/hotshots.1.gz"
}

post_install() {
    update-desktop-database -q
}