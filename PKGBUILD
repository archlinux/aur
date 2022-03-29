# Maintainer: Ranadeep B < mail at rnbguy dot at >

_basename=decentr-browser
_pkgname=$_basename-unstable
pkgname=$_pkgname-bin
pkgver=96.5.4664.32
pkgrel=1
pkgdesc='A secure browser that gives you access to the blockchain'
arch=('x86_64')
url='https://decentr.net'
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=()
source=('https://decentr.net/files/Ubuntu_x64_Decentr_1.1.5.zip')
sha256sums=('0f2e832977c7720859b56a018f83f057c1434d6b6e831db5e9b2baedaef17669')

package() {
	bsdtar -xf ${srcdir}/decentr-browser-unstable_${pkgver}-1_amd64.deb -C "$srcdir/"
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
