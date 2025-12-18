# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=cruiser
pkgver=5.7.4
pkgrel=1
pkgdesc="Map and navigation application using offline vector maps"
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Cruiser"
license=('proprietary (free)')
depends=('java-runtime')
conflicts=('atlas-maps')
replaces=('atlas-maps' 'atlas-maps-bin' 'atlas-maps-beta-bin')
source=("https://github.com/devemux86/cruiser/releases/download/${pkgver}/cruiser-${pkgver}.zip"
        'cruiser.desktop')
sha256sums=('9c4c7f12354edd991bb729fb98e04879027ab37047e86036bc5e92d5c8ac2811'
            '45408583c719a8da9845c2e83bdd63f19c326dbfbfea59d768f42701d6c714e6')
noextract=("cruiser-$pkgver.zip")
_extractname="${pkgname}_${pkgver}-${pkgrel}"

prepare() {
    # Manually extract source to force "--cleanbuild"
    # because all files from $srcdir/cruiser/lib are installed

    mkdir "$srcdir/${_extractname}"
    cd "$srcdir/${_extractname}"

    bsdtar -xf "$srcdir/cruiser-$pkgver.zip" --strip-components 1
}

build() {
    cd "$srcdir/${_extractname}"
    sed -i 's#cd "$(dirname "$0")"#cd /usr/share/java/cruiser#' cruiser.sh
}

package() {
    cd "$srcdir/${_extractname}"

    install -Dm644 "cruiser.jar" "$pkgdir/usr/share/java/cruiser/cruiser.jar"
    install -Dm644 -t "$pkgdir/usr/share/java/cruiser/lib" lib/*.jar
    install -Dm755 "cruiser.sh" "$pkgdir/usr/bin/cruiser"
    install -Dm644 "cruiser.png" "${pkgdir}/usr/share/pixmaps/cruiser.png"
    install -Dm644 "${srcdir}/cruiser.desktop" "${pkgdir}/usr/share/applications/cruiser.desktop"
}
