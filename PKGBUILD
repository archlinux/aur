# Maintainer: Integral <integral@murena.io>

pkgname=daed-bin-x64-v3
_pkgname=daed
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern dashboard for dae, bundled with dae-wing (backend API server) and dae (core)."
url="https://daeuniverse.github.io/daed"
arch=('x86_64')
license=('AGPL' 'MIT')
provides=('daed')
conflicts=('daed-git')
source=("https://github.com/daeuniverse/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64_v3_avx2.zip")
sha512sums=('bdfdb87ee872c03a01e18f7b9908c1e6739c505f9b3da8fc60892d8eaaa7299fc8bcaa3d9bd97180aa132d02d381c50c3212d591c8a096a4da1f6f6669a531ee')

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
