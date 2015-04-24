# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.161.2
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
sha256sums_i686=('3b87582ca7377e5e7c855bd022e7c659654809b7b9b69d9f0d043eb36c744502')
sha256sums_x86_64=('743c0f555b2189823ade44c96ead2596c809001cdca68f61a8df390e79981747')

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

