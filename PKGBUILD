# Maintainer: Ranadeep B < mail at rnbguy dot at >

pkgname=decentr-browser
pkgver=1.3.2
pkgrel=1
pkgdesc='A secure browser that gives you access to the blockchain'
arch=('x86_64')
url='https://decentr.net'
license=('Apache')
provides=($pkgname)
conflicts=($pkgname $pkgname-unstable-bin)
depends=()
source=("https://decentr.net/files/Ubuntu_x64_Decentr_${pkgver}.zip")
sha256sums=('0b0f9fa7d8e296a82fb081b1c984b92d989befb027ed9332d612b1e9f82b6be5')

_pkgver() {
	curl -s "https://decentr.net" | grep -oP "(?<=https://decentr.net/files/Ubuntu_x64_Decentr_).*(?=.zip)"
}

package() {
	bsdtar -xf ${srcdir}/Ubuntu_x64_Decentr_${pkgver}.deb -C "$srcdir/"
	bsdtar -xf ${srcdir}/data.tar.xz -C "$pkgdir/"

	generic_path="decentr.org/decentr"

	# Icons
	for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 "$pkgdir"/opt/${generic_path}/product_logo_${i/x*/}.png \
			"$pkgdir"/usr/share/icons/hicolor/$i/apps/${pkgname}.png
	done

	echo "  -> Fixing Decentr browser desktop entry..."
	sed -i \
		-e "/Exec=/i\StartupWMClass=Decentr-browser" \
		-e "s/x-scheme-handler\/ftp;\?//g" \
		"$pkgdir"/usr/share/applications/${pkgname}.desktop

	echo "  -> Removing Debian Cron job, duplicate product logos and menu directory..."
	rm -r \
		"$pkgdir"/etc/cron.daily/ \
		"$pkgdir"/opt/"$generic_path"/cron/ \
		"$pkgdir"/opt/"$generic_path"/product_logo_*.{png,xpm} \
		"$pkgdir"/usr/share/menu/
}
