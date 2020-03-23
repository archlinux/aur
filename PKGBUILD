# Maintainer: Scott Harrison <scott.arch@scottrix.co.uk>
# Base on apulse by: Christian Hesse <arch@eworm.de>

pkgname=alibpulse
pkgver=0.1.12
pkgrel=2
pkgdesc='PulseAudio emulation for ALSA'
arch=('i686' 'x86_64')
url='https://github.com/i-rinat/apulse'
license=('custom:MIT')
depends=('alsa-lib' 'glib2')
provides=('pulseaudio' 'pulseaudio-alsa' 'libpulse' 'apulse' 'libpulse.so=0-64')
conflicts=(${provides[@]})
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'asoundrc.sample')
sha256sums=('cfcadfe971abd785ed3ca24e576fcbaade185525c1eda76daf32dbf298e52892'
            'e851197ec9ebff528154210751cd6d5c426abfc2b1aa34343580407b1ea789a4')

prepare() {
	cd apulse-${pkgver}

	mkdir -p build
}

build() {
	cd apulse-${pkgver}/build

	cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd apulse-${pkgver}/build

	make DESTDIR="${pkgdir}/" install

        # Move the libs to the correct place
        mv "${pkgdir}/usr/lib/apulse/"lib* "${pkgdir}/usr/lib/"
        # Remove the apulse script and man page
        rm -rf "${pkgdir}/usr/bin" "${pkgdir}/usr/share/man" "${pkgdir}/usr/lib/apulse"
        # Install the headers
        mkdir "${pkgdir}/usr/include"
        cp -Rpd "../3rdparty/pulseaudio-headers/pulse" "${pkgdir}/usr/include/"

	# sample asoundrc
	install -Dm644 ../../${source[1]} \
		"${pkgdir}/usr/share/${pkgname}/${source[1]}"

	# license
	install -Dm644 ../LICENSE.MIT \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

