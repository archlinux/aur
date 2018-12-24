# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=cruiser
pkgver=1.5
pkgrel=1
pkgdesc="Map and navigation application using offline vector maps"
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Cruiser"
license=('proprietary (free)')
depends=('java-runtime')
conflicts=('atlas-maps')
replaces=('atlas-maps' 'atlas-maps-bin' 'atlas-maps-beta-bin')
source=("http://www.talent.gr/public/cruiser/cruiser-desktop-${pkgver}.zip"
        "cruiser.sh")
md5sums=('21af060f17b1d5c25774c45f828585ca'
         '6c23697fc0421c752227dd1e1f29245f')
noextract=("cruiser-desktop-$pkgver.zip")
_extractname="${pkgname}_${pkgver}-${pkgrel}"

prepare() {
    # Manually extract source to force "--cleanbuild"
    # because all files from $srcdir/cruiser/lib are installed

    mkdir "$srcdir/${_extractname}"
    cd "$srcdir/${_extractname}"

    bsdtar -xf "$srcdir/cruiser-desktop-$pkgver.zip" --strip-components 1
}

build() {
    sed 's/cruiser.jar/cruiser-gl.jar/' cruiser.sh > cruiser-gl.sh
}

package() {
    for _f in cruiser{,-gl}; do
        install -Dm644 "${_extractname}/$_f.jar" "$pkgdir/usr/share/java/cruiser/$_f.jar"
        install -Dm755 "$_f.sh" "$pkgdir/usr/bin/$_f"
    done

    cd "${_extractname}/lib"
    for _f in *.jar; do
        install -Dm644 "$_f" "$pkgdir/usr/share/java/cruiser/lib/$_f"
    done
}
