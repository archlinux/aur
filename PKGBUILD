# Maintainer: Ranadeep B < mail at rnbguy dot at >

_basename=decentr-browser
_pkgname=$_basename-unstable
pkgname=$_pkgname-bin
pkgver=1.1.6
pkgrel=1
pkgdesc='A secure browser that gives you access to the blockchain'
arch=('x86_64')
url='https://decentr.net'
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=()
source=("https://decentr.net/files/Ubuntu_x64_Decentr_${pkgver}.zip")
sha256sums=('de9325ffc32cb86e4f4667d8ba61ec876b29f12f9dc844368d5901b96d400498')

package() {
	bsdtar -xf ${srcdir}/decentr-browser-unstable_*-1_amd64.deb -C "$srcdir/"
	bsdtar -xf ${srcdir}/data.tar.xz -C "$pkgdir/"

	generic_path="decentr.org/decentr-unstable"

	# Icons
	for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
		install -Dm644 "$pkgdir"/opt/${generic_path}/product_logo_${i/x*/}.png \
			"$pkgdir"/usr/share/icons/hicolor/$i/apps/${_pkgname}.png
	done

	echo "  -> Fixing Decentr browser desktop entry..."
	sed -i \
		-e "/Exec=/i\StartupWMClass=Decentr-browser" \
		-e "s/x-scheme-handler\/ftp;\?//g" \
		"$pkgdir"/usr/share/applications/${_pkgname}.desktop

	echo "  -> Removing Debian Cron job, duplicate product logos and menu directory..."
	rm -r \
		"$pkgdir"/etc/cron.daily/ \
		"$pkgdir"/opt/"$generic_path"/cron/ \
		"$pkgdir"/opt/"$generic_path"/product_logo_*.{png,xpm} \
		"$pkgdir"/usr/share/menu/
}
