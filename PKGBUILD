# Maintainer: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=mshv
pkgver=270
pkgrel=1
pkgdesc="Amateur radio software by LZ2HV for digital modes MSK, JTMS, FSK, ISCAT, JT6M, FT8/4, JT65, PI4, Q65."
arch=('any')
url="http://lz2hv.org/mshv"
license=('GPL3')
depends=('fftw' 'alsa-lib' 'libpulse' 'qt5-base' 'qt5-websockets' 'hamradio-menus')
makedepends=()
conflicts=('mshv')
provides=('mshv')

# This is suboptimal. But pkgver doesn't seem to get updated soon enough to allow sources to properly download.
_sfrss="$(curl -s -L "https://sourceforge.net/projects/mshv/rss?path=/")"
_latestver="$(echo "$_sfrss" | \
	grep -Poi ' url="https://sourceforge.net/projects/mshv/files/MSHV_\K(\d+)_Full_Source_Code\.zip/download" filesize="\d+"><media:hash algo="md5">([a-fA-F0-9]{32})</media:hash></media:content>'\
	| head -n1 \
	| cut -d '_' -f 1)"
_latesthash="$(echo "$_sfrss" | \
	grep -Poi ' url="https://sourceforge.net/projects/mshv/files/MSHV_(\d+)_Full_Source_Code\.zip/download" filesize="\d+"><media:hash algo="md5">\K([a-fA-F0-9]{32})</media:hash></media:content>'\
	| head -n1 \
	| cut -d '<' -f 1)"
	
source=(
	"https://downloads.sourceforge.net/project/mshv/MSHV_${_latestver}_Full_Source_Code.zip"
	"mshv_launcher.sh"
	"mshv.desktop"
)
sha256sums=(
	'SKIP'
	'5ccd21e3d585efb4f37aff8a3470aefa78a8689dad3b00334b9a8467840adbab'
	'85c256463746cb8a06ff1eee71677dcbe1d1c54d7aaf0f27156ebe9632269dba'
)
md5sums=(
	"$_latesthash"
	'SKIP'
	'SKIP'
)

pkgver() {
	echo "$_latestver"
}

build() {
	cd "$srcdir/MSHV_${_latestver}"

	# There doesn't seem to be any difference between the .pro files apart from absolute paths
	# passed to the linker for some libraries. We'll just rely on ld to find the libraries.
	qmake MSHV_x86_64.pro PREFIX=/usr
	make
}

package() {
	cd "$srcdir"
	install -D -m755 mshv_launcher.sh "$pkgdir/usr/bin/mshv"
	install -D -m644 mshv.desktop "$pkgdir/usr/share/applications/mshv.desktop"

	cd "$srcdir/MSHV_${_latestver}/bin"
	install -D -m755 MSHV_x86_64 "$pkgdir/usr/bin/mshv_bin"

	find . -type d -exec install -d -m755 "$pkgdir/usr/share/mshv/"{} \;
	find . ! -name 'MSHV_x86_64' -type f -exec install -D -m644 {} "$pkgdir/usr/share/mshv/"{} \;
	
	install -D -m644 settings/resources/ms_ico.png "$pkgdir/usr/share/pixmaps/mshv.png"
}
