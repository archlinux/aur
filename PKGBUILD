# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=wexond
pkgver=2.2.3
pkgrel=1
pkgdesc='A privacy-focused, extensible and beautiful web browser'
arch=('i686' 'x86_64')
url='https://github.com/wexond/wexond'
license=('GPL')
makedepends=('p7zip')
options=('!strip')
provides=(wexond)
conflicts=(wexond)
source=('wexond')
source_i686=("wexond-${pkgver}.AppImage::https://github.com/wexond/wexond/releases/download/v${pkgver}/wexond-${pkgver}-i386.AppImage")
source_x86_64=("wexond-${pkgver}.AppImage::https://github.com/wexond/wexond/releases/download/v${pkgver}/wexond-${pkgver}-x86_64.AppImage")
sha256sums=(SKIP)
sha256sums_i686=('6810f89c1af92eab502c3be5e9d93d3c2be4f8fea2e699cd72c8693cace30c84')
sha256sums_x86_64=('ea1906f136c154520e7bc599e2ab6fd439ca74ef473e49f4e454930d8faf6619')

prepare() {
    cd $srcdir
    chmod u+x wexond-${pkgver}.AppImage
    ./wexond-${pkgver}.AppImage --appimage-extract 2> /dev/null
}

build() {
    cd $srcdir
    sed -i "s/^Exec=AppRun$/Exec=$pkgname/" squashfs-root/wexond.desktop
    # sed -i "s/^Categories=AudioVideo/Categories=Video;Player;AudioVideo/" squashfs-root/molotov.desktop
    sed -i "s/WEXOND_VERSION/${pkgver}/g" wexond
}

package() {
    cd $srcdir

    install -d -m755 $pkgdir/usr/share/{applications,icons/hicolor}
    install -d -m755 $pkgdir/opt/appimages
    # TODO find a decent license
    #install -d -m755 $pkgdir/usr/share/licenses/$pkgname

    hicolor="squashfs-root/usr/share/icons/hicolor"
    for size in $(ls -1 $hicolor); do
        install -d -m755 $pkgdir/usr/share/icons/hicolor/$size/apps
        install -D -m644 $hicolor/$size/apps/wexond.png $pkgdir/usr/share/icons/hicolor/$size/apps/wexond.png
    done

    install -D -m644 squashfs-root/wexond.desktop $pkgdir/usr/share/applications/appimagekit-wexond.desktop
    install -D -m755 wexond $pkgdir/usr/bin/wexond
    install -D -m755 wexond-$pkgver.AppImage $pkgdir/opt/appimages/wexond-$pkgver.AppImage
    rm -r squashfs-root
}