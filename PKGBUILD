# Maintainer: Ranadeep B < mail at rnbguy dot at >

pkgname=decentr-browser
pkgver=1.5.1
pkgrel=1
pkgdesc='A secure browser that gives you access to the blockchain'
arch=('x86_64')
url='https://decentr.net'
license=('Apache')
provides=($pkgname)
conflicts=($pkgname $pkgname-unstable-bin)
depends=()
source=("https://decentr.net/Ubuntu_x64_Decentr_${pkgver}.zip")
sha256sums=('d338ff3f67986fe0c24b684db11ed63ffaf55afb74358ba4b148261f0a8414bc')

_pkgver() {
	curl -s "https://decentr.net" | grep -oP "(?<=https://decentr.net/Ubuntu_x64_Decentr_).*(?=.zip)"
}

package() {
	bsdtar -xf ${srcdir}/decentr-browser-stable_*_amd64.deb -C "$srcdir/"
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
