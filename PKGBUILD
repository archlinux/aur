# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=sdrconnect
pkgver=0.0.0.4
build=5dce37273
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
        "sdrconnect.service")
sha256sums=('813615889e26d412e63c8c383626e370376d367c5109e909d61fe4070a1d8def'
            '4b9fb2be7c968874c71b003ea2eff1bef12feea70b0557315c9a5dbf8056851b'
            '0ac0db2d91ebfe442a80e0f5fb153ec0f93864abf5ae15c6163d9c3abc103498')
sha256sums_aarch64=('cf8f4611ae9aaf69cae468f0bae479938169636a05300a8c7792a598b026c4af')
sha256sums_x86_64=('70ec8cc3cc70266e882912ba3ec50ad2bd2c38d58e950fcbb6418df0cf756abb')

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
	install -D -m644 67-sdrplay.rules "${pkgdir}/usr/lib/udev/rules.d/67-sdrplay.rules"

	install -m 755 -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/SDRconnect" "${pkgdir}/usr/bin/${pkgname}"

	# install the service; should best used as user
        # static server port for the moment
	install -D -m644 sdrconnect.service -t "${pkgdir}/usr/lib/systemd/system"
	install -D -m644 sdrconnect.service -t "${pkgdir}/usr/lib/systemd/user"
}
