# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.138.4
pkgrel=1
pkgdesc='A new browser for our friends (weekly snapshot)'
url="https://vivaldi.com"
install=vivaldi.install
options=(!strip !zipman)
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=('ffmpeg: playback of proprietary formats')
conflicts=('vivaldi')
source_i686=("vivaldi-snapshot_${pkgver}-1_i386.deb::https://vivaldi.com/download/download.php?f=vivaldi-snapshot_${pkgver}-1_i386.deb")
source_x86_64=("vivaldi-snapshot_${pkgver}-1_amd64.deb::https://vivaldi.com/download/download.php?f=vivaldi-snapshot_${pkgver}-1_amd64.deb")
sha256sums_i686=('da17edce5a680e1d32399c97f310e1ecb74315e92afbf7a7adc9bb6a75e860de')
sha256sums_x86_64=('4b66a877fb33292e1c3322dca29f0f2647a240182029f263094824bdf80f9b50')

package() {
	tar -xf data.tar.xz --exclude={usr/share/{lintian,menu},etc} -C "$pkgdir/"

	# soname fix for libsystemd (udev)
	sed -e 's/libudev.so.0/libudev.so.1/g' \
		-i "$pkgdir/opt/vivaldi-snapshot/vivaldi-bin"

	# suid sanbox
	chmod 4755 "$pkgdir/opt/vivaldi-snapshot/vivaldi-sandbox"

	# install icons
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/vivaldi-snapshot/product_logo_${res}.png" \
		"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi-snapshot.png"
	done
}

