# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=sdrconnect
pkgver=0.0.0.3
build=f795c3df0
pkgrel=2
pkgdesc="SDR receiver for SDRplay devices"
arch=('aarch64' 'x86_64')
url="http://www.sdrplay.com/sdrconnect/"
license=('custom:EULA')
depends=('libusb>=1.0' 'glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'brotli' 'expat'
         'bzip2' 'libpng' 'harfbuzz' 'graphite' 'pcre2' 'alsa-lib')
source_x86_64=("https://www.sdrplay.com/software/SDRconnect_linux-x64_${build}.run")
source_aarch64=("https://www.sdrplay.com/software/SDRconnect_linux-arm64_${build}.run")
source=("sdrconnect.desktop"
        "67-sdrplay.rules")
sha256sums=('813615889e26d412e63c8c383626e370376d367c5109e909d61fe4070a1d8def'
            '113c42683b598d795db10b890b6da5bb5d025c16092106f459bf2a15c44a88e5')
sha256sums_aarch64=('27f589a559ded758f82486654b331e300e8275a37baa958a84a86398896b7069')
sha256sums_x86_64=('291b38cd9c44e52cf18c0a9c98c243b974e744cd1fa4a7deb61d1a15a9d1c48d')

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
        (find *.so -type f -exec install -D -m755 "{}" "${pkgdir}/usr/lib/${pkgname}/{}" \;)
	install -D -m755 "SDRconnect" "${pkgdir}/usr/lib/${pkgname}/SDRconnect"
	install -D -m644 "sdrconnect.ico" "${pkgdir}/usr/share/icons/sdrconnect.ico"
	install -D -m644 "sdrconnect.desktop" "${pkgdir}/usr/share/applications/sdrconnect.desktop"

	# avoid issue with libsdrplay rules
	install -D -m644 67-sdrplay.rules "${pkgdir}/etc/udev/rules.d/67-sdrplay.rules"

	install -m 755 -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/SDRconnect" "${pkgdir}/usr/bin/${pkgname}"
}
