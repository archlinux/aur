# Maintainer: noideaman <pkgbuilds@weebvr.com>

pkgname=oscleash-nuitka
_pkgname=OSCLeash
_pkgname2=oscleash
pkgver=2.2.0
pkgrel=3
pkgdesc="Get pulled around in VRChat (built with nuitka)"
arch=("any")
url="https://github.com/ZenithVal/$_pkgname"
license=("MIT")
depends=("python")
makedepends=("python-setuptools" "python-osc" "python-tinyoscquery" "python-inputs" "nuitka")
provides=("oscleash")
conflicts=("${_pkgname2}" "${pkgname}-git" "${_pkgname2}-git")
source=("https://github.com/ZenithVal/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "OSCLeash.desktop"
        "OSCLeash.svg"
	"oscleash")
options=(!strip)
sha256sums=('ced2294cd4245c37ac77969dd17d9819a0d197a40fdbda7913c33551524aae88'
            '984dda198cf1417327b959055941c7adea86932c3cdb0a462738644cfd8a7e59'
            '6183c816b8b5ff4a2f60ed8becae841c481c2d3ca60d2580ebd601abfd43835e'
            '9a34c193dc36395c631e8fa977281695be581d286041b679b5cf87384dc77284')
prepare() {
	sed  -i 's/UseOSCQuery.*/UseOSCQuery\"\: true\,/' $srcdir/$_pkgname-$pkgver/Config.json
}
build () {
	cd $srcdir/$_pkgname-$pkgver/
	nuitka OSCLeash.py --mode=onefile
}
package() {
    # Extract and copy everything to /opt
    install -dm757 "$pkgdir/opt/$_pkgname"
    cp "$srcdir/$_pkgname-$pkgver/OSCLeash.bin" "$pkgdir/opt/$_pkgname/OSCLeash.bin"
    cp "$srcdir/$_pkgname-$pkgver/Config.json" "$pkgdir/opt/$_pkgname/Config.json.example"
    
    # Install desktop file
    install -Dm644 "$srcdir/OSCLeash.desktop" \
        "$pkgdir/usr/share/applications/oscleash.desktop"
    
    # Install icon
    install -Dm644 "$srcdir/OSCLeash.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/oscleash.svg"

    #install launcher
    install -Dm755 "$srcdir/oscleash" \
        "$pkgdir/usr/bin/oscleash"

}
