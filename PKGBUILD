# Maintainer: ZeroWeb <zeroweb91 at protonmail dot com>
# Contributors: Det, Achilleas Pipinellis, speed145a, Schnouki

pkgname=ungoogled-chromium-bin
pkgver=64.0.3282.186
pkgrel=5
pkgdesc="Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparencyi (binary version)"
arch=("x86_64")
url="https://github.com/Eloston/ungoogled-chromium"
license=("BSD")
depends=("libjpeg6-turbo" "icu57" "libevent-compat" "nss" "libxss" "snappy" "gtk3" "minizip"
		"libxslt")
provides=("chromium")
conflicts=("chromium" "iridium" "ungoogled-chromium")
optdepends=("ffmpeg: H264/AAC/MP3 decoding")
source=("ungoogled-chromium.deb::https://github.com/Eloston/ungoogled-chromium-binaries/releases/download/${pkgver}-1/ungoogled-chromium_${pkgver}-1.stretch_amd64.deb"
		"ungoogled-chromium-common.deb::https://github.com/Eloston/ungoogled-chromium-binaries/releases/download/${pkgver}-1/ungoogled-chromium-common_${pkgver}-1.stretch_amd64.deb"
		"uchromium.sh")
noextract=("ungoogled-chromium-common.deb")
sha256sums=("714ff700d02b60233ccf92a54ebbd2b8eeb1499bb9097322e3874dc3a111e0ec"
			"653e0ddd5636ef39f56a86baac8d3a9796af8fbcfdbfc8e91d8121d9e34cba0a"
			"1d5f907cadc73071f1770cfed92211d88a3c9b19e6bf24be8208bb4da5d73c4a")
install=ungoogled-chromium-bin.install

prepare() {
	# Decompress common files
	mkdir ${srcdir}/common
	cd ${srcdir}/common
	bsdtar -f ${srcdir}/ungoogled-chromium-common.deb -x
	tar -xf data.tar.xz
	# Decompress browser files
	cd ${srcdir}
	tar -xf data.tar.xz
}

package() {
	cd ${srcdir}

	install -d "${pkgdir}/usr/lib/chromium"
	cp -r usr/lib/chromium/* "${pkgdir}/usr/lib/chromium"

	install -d "${pkgdir}/usr/share/icons"
	cp -r usr/share/icons/* "${pkgdir}/usr/share/icons"

	install -d "${pkgdir}/usr/share/man"
	cp -r usr/share/man/* "${pkgdir}/usr/share/man"

	install -d "${pkgdir}/usr/share/applications"
	cp -r usr/share/applications/* "${pkgdir}/usr/share/applications"

  	cp -r "${srcdir}/common/usr/lib/chromium"/* "${pkgdir}/usr/lib/chromium"

  	install -Dm755 "${srcdir}"/uchromium.sh "${pkgdir}"/usr/bin/chromium
}
