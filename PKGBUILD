# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=cruiser
pkgver=3.0.6
pkgrel=1
pkgdesc="Map and navigation application using offline vector maps"
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Cruiser"
license=('proprietary (free)')
depends=('java-runtime')
conflicts=('atlas-maps')
replaces=('atlas-maps' 'atlas-maps-bin' 'atlas-maps-beta-bin')
source=("https://github.com/devemux86/cruiser/releases/download/${pkgver}/cruiser-${pkgver}.zip")
md5sums=('8be4ecf3189775087e42c22907f0653e')
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
}
