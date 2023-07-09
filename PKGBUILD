# Maintainer: Integral <integral@murena.io>

pkgname=daed-bin-x64-v3
_pkgname=daed
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern dashboard for dae, bundled with dae-wing (backend API server) and dae (core)."
url="https://daeuniverse.github.io/daed"
arch=('x86_64')
license=('AGPL' 'MIT')
provides=('daed')
conflicts=('daed-git')
source=("https://github.com/daeuniverse/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64_v3_avx2.zip")
sha512sums=('b7710562872e896c4c684f5802909c9c1a0a2e0f4c1874b84b740d4b453f2424b4fae64f3d058f81e8466088d4847b6d8ae68e72c83a88054059fd2a51314372')

prepare() {
	if !(/lib/ld-linux-x86-64.so.2 --help | grep "x86-64-v3 (supported, searched)" &> /dev/null); then
		echo "Your CPU does NOT support x86-64-v3!"
		echo "Exiting..."
		exit 1
	fi
}

package() {
	# Install binary
	mv "daed-linux-x86_64_v3_avx2" "${_pkgname}"
	install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"

	# Install systemd service
	install -vDm644 "daed.service" -t "${pkgdir}/usr/lib/systemd/system/"

	# Install geoip.dat & geosite.dat
	install -vDm644 "geoip.dat" -t "${pkgdir}/usr/share/${_pkgname}/"
	install -vDm644 "geosite.dat" -t "${pkgdir}/usr/share/${_pkgname}/"

	echo "After installation completed, open your browser and navigate to http://localhost:2023"
}
