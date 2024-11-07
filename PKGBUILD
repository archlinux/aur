# Maintainer: Liviu Solcovenco <solcovenco.liviu at gmail dot com>
pkgbase=libasound2-plugin-fftrate
pkgname=('libasound2-plugin-fftrate' 'alsa-config-utils' 'pcm-utils')
pkgdesc="ALSA library plugin - FFT based rate converter and utilities"
pkgver=1.6.3
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/PetrovSE/fftrate"
license=('GPL')
makedepends=('alsa-lib>=1.0.22' 'git' 'fftw')
source=("$pkgbase-$pkgver::git+https://github.com/PetrovSE/fftrate.git")
sha256sums=('SKIP')
groups=('fftrate')

prepare() {
	cd "$srcdir/$pkgbase-$pkgver"
	find . -type f \( -name "*.cpp" -o -name "*.c" -o -name "*.h" \) -exec sed -i -e 's/min(/MIN(/g' -e 's/max(/MAX(/g' {} +
}

build() {
	cd "$srcdir/$pkgbase-$pkgver"
	make -j1
}

package_libasound2-plugin-fftrate() {
	pkgdesc="ALSA library additional plugin - FFT based rate converter"
	depends=('alsa-lib' 'alsa-plugins')
	groups=('fftrate')
	
	cd "$srcdir/$pkgbase-$pkgver"
	# Create required directories
	install -dm755 "$pkgdir/usr/lib/alsa-lib"
	install -dm755 "$pkgdir/etc"
	
	# Install the plugin
	find . -name "*.so" -exec install -Dm644 {} "$pkgdir/usr/lib/alsa-lib/" \;
	
	# Install the configuration file
	install -Dm644 packets/etc/fftrate.conf "$pkgdir/etc/fftrate.conf"
}

package_alsa-config-utils() {
	pkgdesc="ALSA configurator - includes arateconf utility"
	depends=('alsa-lib' 'alsa-plugins' 'libasound2-plugin-fftrate' 'swh-plugins')
	groups=('fftrate')
	
	cd "$srcdir/$pkgbase-$pkgver"
	install -dm755 "$pkgdir/usr/bin"
	if [ -f bin/arateconf ]; then
		install -Dm755 bin/arateconf "$pkgdir/usr/bin/arateconf"
	fi
}

package_pcm-utils() {
	pkgdesc="Wave PCM utils for PCM file processing"
	groups=('fftrate')
	depends=()
	
	cd "$srcdir/$pkgbase-$pkgver"
	install -dm755 "$pkgdir/usr/bin"
	for util in bin/pcm_*; do
		if [ -f "$util" ]; then
			install -Dm755 "$util" "$pkgdir/usr/bin/$(basename $util)"
		fi
	done
}
