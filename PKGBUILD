# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=lib32-apulse
pkgver=0.1.6
pkgrel=1
pkgdesc='PulseAudio emulation for ALSA, multilib.'
arch=('x86_64')
url='https://github.com/i-rinat/apulse'
license=('custom:MIT')
depends=('lib32-glib2' 'lib32-alsa-lib')
makedepends=('cmake' 'gcc-multilib')
install=lib32-apulse.install
source=("apulse-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'asoundrc.sample')
sha256sums=('f9ffbf7aff96680beff3243758e5c1e0d4ac9043d4bd6cbfb219890b4b91c9f3'
            'e851197ec9ebff528154210751cd6d5c426abfc2b1aa34343580407b1ea789a4')

prepare() {
	cd apulse-${pkgver}
	mkdir -p build

	# install in /usr/lib32
	sed -i '/APULSEPATH/s/lib/&32/' CMakeLists.txt
}

build() {
	cd apulse-${pkgver}/build

	export CFLAGS=-m32
	export CXXFLAGS=-m32

	cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd apulse-${pkgver}/build

	make DESTDIR="${pkgdir}/" install

	# do not conflict with apulse
	mv "${pkgdir}/usr/bin/apulse" \
		"${pkgdir}/usr/bin/apulse32"

	# sample asoundrc
	install -Dm644 ../../${source[1]} \
		"${pkgdir}/usr/share/${pkgname}/${source[1]}"

	# license
	install -Dm644 ../LICENSE.MIT \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

