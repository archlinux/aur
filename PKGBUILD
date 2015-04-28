# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi
pkgver=1.0.162.4
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind.'
url="https://vivaldi.com"
install=${pkgname}.install
options=(!strip !zipman)
license=('custom')
arch=('x86_64' 'i686')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=('ffmpeg: playback of proprietary formats')
source_x86_64=("https://vivaldi.com/download/Vivaldi_TP3.${pkgver}-1_amd64.deb")
source_i686=("https://vivaldi.com/download/Vivaldi_TP3.${pkgver}-1_i386.deb")
sha256sums_x86_64=('e318e8100adf72e936618b18685ef107bc1e465559e3b78853fef4be5d9ee4b9')
sha256sums_i686=('07aecd6835996606e82f6c9d158a1c228ef8d1767680b15fc9fa493d16973f36')

package() {
	tar -xf data.tar.xz --exclude={etc,usr/share/{lintian,menu}} -C "$pkgdir/"

	# soname fix for libsystemd (udev)
	sed -e 's/libudev.so.0/libudev.so.1/g' \
		-i "$pkgdir/opt/vivaldi/vivaldi-bin"

	# suid sanbox
	chmod 4755 "$pkgdir/opt/vivaldi/vivaldi-sandbox"

	# install icons
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/vivaldi/product_logo_${res}.png" \
		"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi.png"
	done
}

