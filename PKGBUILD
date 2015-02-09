# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.98.2
pkgrel=1
pkgdesc='A new browser for our friends (weekly snapshot)'
url="https://vivaldi.com"
install=vivaldi.install
options=(!strip !zipman)
license=('custom')
arch=('x86_64')
source=("https://vivaldi.com/download/snapshot/Vivaldi-snapshot_${pkgver}-1_amd64.deb")
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info')
optdepends=('ffmpeg: playback of proprietary formats')
conflicts=('vivaldi')

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

sha256sums=('d79a6975c38aa0bbb4c69e77ea1d553e3b6c0584068f7522f22c81727ada3c6b')
