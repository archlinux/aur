# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=sdrconnect
pkgver=1.0.5
build=583e89db6
pkgrel=2
pkgdesc="SDR receiver for SDRplay devices"
arch=('aarch64' 'x86_64')
url="http://www.sdrplay.com/sdrconnect/"
license=('custom:EULA')
depends=('libusb>=1.0' 'glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'brotli' 'expat'
         'bzip2' 'libpng' 'harfbuzz' 'graphite' 'pcre2' 'alsa-lib' 'util-linux-libs')
source_x86_64=("https://www.sdrplay.com/software/SDRconnect_linux-x64_${build}.run")
source_aarch64=("https://www.sdrplay.com/software/SDRconnect_linux-arm64_${build}.run")
source=("sdrconnect.desktop"
        "67-sdrplay.rules"
        "sdrconnect.service"
        "sdrconnect.png")
sha256sums=('cea2ec529343ea38f2b89851476367c8a73fe1ed7e7bc3631cc8b88723d8d558'
            'b39086ca99ef4b2242ff9edef93258c99d478fd37a8ba64319843928e316c61b'
            '0ac0db2d91ebfe442a80e0f5fb153ec0f93864abf5ae15c6163d9c3abc103498'
            '9ba3b0356491f53fa876fc66f11dab84c3651b4dc6e149d2c5f8bac64f414b35')
sha256sums_aarch64=('32de689a69eac64a3d882fa545128107bbfdf8309a48614853fbc8766ca7c869')
sha256sums_x86_64=('edc312f88826fe72ebea634799a3ffc2214ce0cd860862fd7de928e2e495045e')

prepare() {
	cd ${srcdir}

	msg2 "Extracting makeself archive..."
	sh SDRconnect_linux-*64_${build}.run --tar xf
}

package() {
	cd "${srcdir}"

	# These commands are equivalent to the scripts used in the supplied
	# run file
	install -D -m644 "sdrplay_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        (find *.so -type f -exec install -D -m755 "{}" "${pkgdir}/opt/${pkgname}/{}" \;)
	install -D -m755 "SDRconnect" "${pkgdir}/opt/${pkgname}/SDRconnect"
	install -D -m644 "sdrconnect.png" "${pkgdir}/usr/share/icons/sdrconnect.png"
	install -D -m644 "sdrconnect.desktop" "${pkgdir}/usr/share/applications/sdrconnect.desktop"

	# avoid issue with libsdrplay rules
	install -D -m644 67-sdrplay.rules "${pkgdir}/usr/lib/udev/rules.d/67-sdrplay.rules"

	install -m 755 -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/SDRconnect" "${pkgdir}/usr/bin/${pkgname}"

	# install the service; should best used as user
        # static server port for the moment
	install -D -m644 sdrconnect.service -t "${pkgdir}/usr/lib/systemd/system"
	install -D -m644 sdrconnect.service -t "${pkgdir}/usr/lib/systemd/user"
}
