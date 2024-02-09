# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=sdrconnect
pkgver=0.0.0.2
build=0fd82d9dc
pkgrel=1
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
sha256sums_aarch64=('afd8af85d751ee9f201b00c134e5588d471f3c176bb7362bcb9b302ed7a918bb')
sha256sums_x86_64=('7200f58efc1bd78250f6057cc08b5564ea9e8f33f8ef655805bbff97f56d38c2')

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
