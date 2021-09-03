# Maintainer: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=mshv
pkgver=258
pkgrel=4
pkgdesc="Amateur radio software by LZ2HV for digital modes MSK, JTMS, FSK, ISCAT, JT6M, FT8/4, JT65, PI4, Q65."
arch=('any')
url="http://lz2hv.org/mshv"
license=('GPL3')
depends=('fftw' 'alsa-lib' 'libpulse' 'qt5-base' 'qt5-websockets' 'hamradio-menus')
makedepends=()
conflicts=('mshv')
provides=('mshv')
source=(
	"https://downloads.sourceforge.net/project/mshv/MSHV_${pkgver}_Full_Source_Code.zip"
	"mshv_launcher.sh"
	"mshv.desktop"
	"flrigxml.patch"
	"pa_with_no_alsa.patch"
)
sha256sums=(
	'039c4d432010fdae0805a023960145038c6ae780f7c439d77514aff6cf80cf1d'
	'5ccd21e3d585efb4f37aff8a3470aefa78a8689dad3b00334b9a8467840adbab'
	'85c256463746cb8a06ff1eee71677dcbe1d1c54d7aaf0f27156ebe9632269dba'
	'22de199636d17912738651eba8db6b5ccf7cecae816dcddee6d46a33d585f8ca'
	'6d021299b6970e262f73749e2e3b4c859cb5a0f36e19dfd44a0a6924dcc0d7d9'
)

prepare() {
	patch --directory="$srcdir/MSHV_$pkgver" --forward --strip=1 --input="$srcdir/flrigxml.patch"
	patch --directory="$srcdir/MSHV_$pkgver" --forward --strip=1 --input="$srcdir/pa_with_no_alsa.patch"
}

build() {
	cd "$srcdir/MSHV_$pkgver"

	# There doesn't seem to be any difference between the .pro files apart from absolute paths
	# passed to the linker for some libraries. We'll just rely on ld to find the libraries.
	qmake MSHV_x86_64.pro PREFIX=/usr
	make
}

package() {
	cd "$srcdir"
	install -D -m755 mshv_launcher.sh "$pkgdir/usr/bin/mshv"
	install -D -m644 mshv.desktop "$pkgdir/usr/share/applications/mshv.desktop"

	cd "$srcdir/MSHV_$pkgver/bin"
	install -D -m755 MSHV_x86_64 "$pkgdir/usr/bin/mshv_bin"

	find . -type d -exec install -d -m755 "$pkgdir/usr/share/mshv/"{} \;
	find . ! -name 'MSHV_x86_64' -type f -exec install -D -m644 {} "$pkgdir/usr/share/mshv/"{} \;
	
	install -D -m644 settings/resources/ms_ico.png "$pkgdir/usr/share/pixmaps/mshv.png"
}
