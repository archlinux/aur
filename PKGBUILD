# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lite-xl
pkgver=1.12
pkgrel=2
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64')
url="https://github.com/franko/$pkgname"
license=('MIT')
depends=('sdl2' 'agg')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-$pkgname.tar.gz"
        "${pkgname%-xl}-path-fix.patch"
	# credits to 6r1d  for the svg icon
	"https://github.com/rxi/lite/files/4716765/lite.svg.zip")
sha256sums=('4d57c189d0757ee62524d53175fffa0623adf54b31e742dd98da80d0c65151ca'
            'a874de709bf2201816f96807aa50f6b1a15a19aa7989084f01422dd5fe488055'
            '504d2ccd74f1c5b631b5b83a4f4319c74edb705fc383b3058f4b2d9354093b53')

prepare() {
    cd "$pkgname-$pkgver-$pkgname"
    patch -p1 < "$srcdir/${pkgname%-xl}-path-fix.patch"

  # XDG desktop file
  gendesk -n -f \
          --pkgname "$pkgname" \
          --pkgdesc "$pkgdesc" \
          --exec ${pkgname%-xl} \
          --name "Lite XL" \
          --categories "Utility;TextEditor;Development" \
          --mimetype "text/plain"

}

build() {
    arch-meson "$pkgname-$pkgver-$pkgname" build
    meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm 644 "${pkgname%-xl}.svg" \
	"${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm 644 "$pkgname-$pkgver-$pkgname/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
