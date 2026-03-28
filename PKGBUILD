# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=sdrconnect
pkgver=1.0.8
# got from https://www.sdrplay.com/software/install.sh
# or https://www.sdrplay.com/sdrconnect-linux/
build=a4b8da76b
build_rigcontrol=4a50e06
pkgrel=2
pkgdesc="SDR receiver for SDRplay devices"
arch=('aarch64' 'x86_64')
url="http://www.sdrplay.com/sdrconnect/"
license=('custom:EULA')
depends=('libusb>=1.0' 'glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'brotli' 'expat'
         'bzip2' 'libpng' 'harfbuzz' 'graphite' 'pcre2' 'alsa-lib' 'util-linux-libs'
         'lame' 'hamlib')
# disable stripping symbols and debug package
options=(!strip !debug)
source_x86_64=("https://www.sdrplay.com/software/sdrconnect_linux-x64_${build}.tar.gz"
               "https://www.sdrplay.com/software/rigcontrol_linux-x64_${build_rigcontrol}.tar.gz")
source_aarch64=("https://www.sdrplay.com/software/sdrconnect_linux-arm64_${build}.tar.gz"
                "https://www.sdrplay.com/software/rigcontrol_linux-arm64_${build_rigcontrol}.tar.gz")
source=("sdrconnect.desktop"
        "rigcontrol.desktop"
        "67-sdrplay.rules"
        "sdrconnect.service")
sha256sums=('8324e5e61e08e8fead2d0b5bf9f1926d3013c34f9f550ee41b182c4dcf0dd5a0'
            '212ed5b5f82c722aa9e4b86cb4248de9f29fdbdd3853dce9dbbd34d8d0486819'
            'b39086ca99ef4b2242ff9edef93258c99d478fd37a8ba64319843928e316c61b'
            '0ac0db2d91ebfe442a80e0f5fb153ec0f93864abf5ae15c6163d9c3abc103498')
sha256sums_aarch64=('cfc14b05a932ddd143e6c959ff1bdf4b99f87823fce7a0b8dd11d418c582025b'
                    '351fbaa5ddb8a410992297c9f22faeeece1b8a6e1c43ad90870641faded06787')
sha256sums_x86_64=('0cb010929a2dd0ad5e604c3dcb9de63cfe3deac15f6faa3da3ec62a0eaf6b4db'
                   '7ef40446bac23559ed4346132ce098bee6bfd4541a38101f3538833b42b8378b')

package() {
	cd "${srcdir}"

	# These commands are equivalent to the scripts used in the supplied
	# run file
	install -D -m644 "LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
        (find *.so -type f -exec install -D -m755 "{}" "${pkgdir}/opt/${pkgname}/{}" \;)
	install -D -m755 "SDRconnect" "${pkgdir}/opt/${pkgname}/SDRconnect"
	install -D -m755 "SDRconnect_headless" "${pkgdir}/opt/${pkgname}/SDRconnect_headless"
	install -D -m755 "RigControl" "${pkgdir}/opt/${pkgname}/RigControl"
	install -D -m644 "icons/64x64/sdrconnect.png" "${pkgdir}/usr/share/icons/sdrconnect.png"
	install -D -m644 "icons/64x64/rigcontrol.png" "${pkgdir}/usr/share/icons/rigcontrol.png"
	install -D -m644 "sdrconnect.desktop" "${pkgdir}/usr/share/applications/sdrconnect.desktop"
	install -D -m644 "rigcontrol.desktop" "${pkgdir}/usr/share/applications/rigcontrol.desktop"

	# avoid issue with libsdrplay rules
	install -D -m644 67-sdrplay.rules "${pkgdir}/usr/lib/udev/rules.d/67-sdrplay.rules"

	install -m 755 -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/SDRconnect" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "/opt/${pkgname}/SDRconnect_headless" "${pkgdir}/usr/bin/${pkgname}-headless"
	ln -s "/opt/${pkgname}/RigControl" "${pkgdir}/usr/bin/rigcontrol"

	# install the service; should best used as user
        # static server port for the moment
	install -D -m644 sdrconnect.service -t "${pkgdir}/usr/lib/systemd/system"
	install -D -m644 sdrconnect.service -t "${pkgdir}/usr/lib/systemd/user"
}
