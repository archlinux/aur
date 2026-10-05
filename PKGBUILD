# Maintainer: solsTiCe d'Hiver <solsticedhiver@gmail.com>
pkgname=opennow
_pkgname=OpenNOW
pkgver=1.0.2
_pkgver=$pkgver
pkgrel=1
pkgdesc="custom GeForce Now client"
url="https://opennow.zortos.me/"
license=('MIT')
depends=('gtk3' 'cairo' 'pango' 'mesa' 'dbus' 'libx11' 'at-spi2-core' 'hicolor-icon-theme' 'nss' 'nspr' 'alsa-lib' 'sdl3'
	'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-bad-libs' 'gst-libav' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('imagemagick' 'libxcrypt-compat' 'rust' 'cmake' 'qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-shadertools' 'vulkan-headers' 'wayland-protocols' 'ffmpeg')
# dependencies for rust opennow-streamer: cargo gstreamer gst-plugins-base-libs gst-plugins-bad-libs gst-libav gst-plugins-{good|bad|ugly}
provides=('opennow')
conflicts=('opennow-appimage')
arch=('x86_64')
source=(opennow-${pkgver}.tar.gz::https://github.com/OpenCloudGaming/OpenNOW/archive/refs/tags/v${_pkgver}.tar.gz
	opennow.desktop)

sha256sums=('08506d2256b944d8c2c353448a9fc5dd59dabdc4e28ce1f1420f0d7c72c12f46'
            '2ab63a0c3b39b7220bd1d16d5a61daf2578c8b3dadbbbcacd4287d8b568cd513')

#prepare() {
#}

build() {
	cd "$_pkgname-$_pkgver"
	# HELP needed here, to find a better way to deal with compilation error because of archlinux's default flags
	# I couldn't get it to work, so I'm using a hammer
	export CFLAGS=""
	export CXXFLAGS=""
	export LDFLAGS=""
	cmake -S opennow-qt -B build/opennow-qt -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build/opennow-qt

	mkdir hicolor || :
	# create a set of icons from huge logo.png
	for i in 8x8 16x16 20x20 22x22 24x24 32x32 36x36 40x40 42x42 48x48 64x64 72x72 80x80 96x96 128x128 192x192 256x256 384x384 512x512 1024x1024; do
		_dir="hicolor/${i}/apps"
		mkdir -p "${_dir}"
	 	magick logo.png -resize "${i}" "${_dir}/opennow.png"
	done
}

#test() {
#	cd "$_pkgname-$_pkgver"
#	ctest --test-dir build/opennow-qt --output-on-failure
#}

package() {
	cd "$_pkgname-$_pkgver"
	DESTDIR="${pkgdir}" cmake --install build/opennow-qt

	# misc (licence, dekstop)
	install -m644 -D -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	install -m 644 -D -t "${pkgdir}/usr/share/applications/" "${srcdir}/opennow.desktop"
	# icons
	mkdir -p "${pkgdir}/usr/share/icons"
	cp -a hicolor "${pkgdir}/usr/share/icons"

	# move lib to the right place
	mkdir -p ${pkgdir}/usr/lib/
	mv ${pkgdir}/usr/bin/libopennow_streamer_ffi.so ${pkgdir}/usr/lib/
	chmod -x ${pkgdir}/usr/lib/libopennow_streamer_ffi.so
}
