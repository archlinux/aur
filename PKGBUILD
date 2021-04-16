# Maintainer: jzbor <zborof at posteo dot de>
# This is an adjusted version of aur/touchegg which is maintained by:
# AwesomeHaircut <jesusbalbastro@gmail.com>
# jbouter <aur@kn0x.org>

pkgname=touchegg-nosystemd
pkgver=2.0.9
pkgrel=1
pkgdesc="Multitouch gesture recognizer (with systemd support disabled)"
arch=('i686' 'x86_64')
url="https://github.com/JoseExposito/touchegg/"
license=('GPL3')
depends=('libinput' 'cairo' 'libx11' 'libxi' 'libxrandr' 'libxtst' 'pugixml' 'gtk3' 'glib2')
makedepends=('cmake')
provides=('touchegg')
conflicts=('touchegg')
# Workaround until 2.0.10
source=("$pkgname-$pkgver.zip::https://github.com/JoseExposito/touchegg/archive/0b21ca4dd87190d6841ceffa6abe9f5db5f59298.zip")
# source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=(4e3fc5586de6efc119c3a1345bf3bfaa6f4ba9a236874b8160e589350e52b1bec4dc7af58521cc8c25fd00e38072dea08b5897599d5728fa7c707ec7d8bbe80c)

build() {
    # Workaround until 2.0.10
    mv touchegg-0b21ca4dd87190d6841ceffa6abe9f5db5f59298 $pkgname-$pkgver

	cmake -B build -S "$pkgname-$pkgver" \
        -DUSE_SYSTEMD=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {

	make -C build DESTDIR="$pkgdir" install

	[ -d "$pkgdir/lib" ] && mv "$pkgdir/lib" "$pkgdir/usr/lib"

	install -Dm644 "$srcdir/$pkgname-$pkgver/installation/touchegg.desktop" "$pkgdir/etc/xdg/autostart/touchegg.desktop"
}

