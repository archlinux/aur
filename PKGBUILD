# Maintainer: KarmaTag <karmatag@proton.me>

pkgname=sdrconnect-nrsp
pkgver=1.0.5
build=e077f2ebe
pkgrel=1
pkgdesc="SDR receiver for SDRplay nRSP-ST"
arch=('aarch64' 'x86_64')
url="https://www.sdrplay.com/nRSPstart/"
license=('custom:EULA')
depends=('libusb>=1.0' 'glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'brotli' 'expat'
         'bzip2' 'libpng' 'harfbuzz' 'graphite' 'pcre2' 'alsa-lib' 'util-linux-libs')
source_x86_64=("https://www.sdrplay.com/software/SDRconnect_linux-x64_${build}_nrsp.run")
source_aarch64=("https://www.sdrplay.com/software/SDRconnect_linux-arm64_${build}_nrsp.run")
source=("sdrconnect-nrsp.desktop"
        "nrspadministrator.desktop"
        "nrspupdater.desktop"
        "66-sdrplay.rules")
sha256sums=('eba89d720a1153a9cf4d061b624dbafe26044ee7bb2e58955a1035778e49e21e'
            '0943ad905989b77283832fdd804f553671f1b42094d93c3103acef27468934a7'
            'd65f2ef4c25465924dfb73e27c13d701da50c287c35197d6d44bba726313d6f5'
            'b39086ca99ef4b2242ff9edef93258c99d478fd37a8ba64319843928e316c61b')
sha256sums_aarch64=('a95c8b4b3bd3a7d19878e639ec3b06bc81efc73db3ff36083b965f089b3c4e69')
sha256sums_x86_64=('2e289b2f9e365f25a6adc3c10ebf39578dc806ed3839829204a292cfa8852066')

prepare() {
	cd ${srcdir}

	msg2 "Extracting makeself archive..."
	sh SDRconnect_linux-*64_${build}_nrsp.run --tar xf
}

package() {
	cd "${srcdir}"

	# These commands are equivalent to the scripts used in the supplied
	# run file
	install -D -m644 "sdrplay_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        (find *.so -type f -exec install -D -m755 "{}" "${pkgdir}/usr/lib/${pkgname}/{}" \;)
        (find *.ico -type f -exec install -D -m644 "{}" "${pkgdir}/usr/share/icons/{}" \;)
        (find *.desktop -exec install -D -m644 "{}" "${pkgdir}/usr/share/applications/{}" \;)
	install -D -m755 "SDRconnect" "${pkgdir}/usr/lib/${pkgname}/SDRconnect"
	install -D -m755 "NRSPAdministrator" "${pkgdir}/usr/lib/${pkgname}/NRSPAdministrator"
	install -D -m755 "NRSPUpdater" "${pkgdir}/usr/lib/${pkgname}/NRSPUpdater"

	# avoid issue with libsdrplay rules
	install -D -m644 66-sdrplay.rules "${pkgdir}/usr/lib/udev/rules.d/66-sdrplay.rules"

	install -m 755 -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/SDRconnect" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "/usr/lib/${pkgname}/NRSPAdministrator" "${pkgdir}/usr/bin/NRSPAdministrator"
	ln -s "/usr/lib/${pkgname}/NRSPUpdater" "${pkgdir}/usr/bin/NRSPUpdater"
}
