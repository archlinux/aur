# Maintainer: solsTiCe d'Hiver <solsticedhiver@gmail.com>
pkgname=opennow
_pkgname=OpenNOW
pkgver=1.0.3
_pkgver="$pkgver"
pkgrel=3
pkgdesc="custom GeForce Now client"
url="https://opennow.zortos.me/"
license=('MIT')
depends=('gtk3' 'cairo' 'pango' 'mesa' 'dbus' 'libx11' 'at-spi2-core' 'hicolor-icon-theme' 'nss' 'nspr' 'alsa-lib' 'sdl3'
	'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-bad-libs' 'gst-libav' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'qt6-base' 'qt6-declarative' 'qt6-multimedia')
makedepends=('imagemagick' 'libxcrypt-compat' 'rust' 'cmake' 'qt6-shadertools' 'vulkan-headers' 'wayland-protocols' 'ffmpeg' 'clang' 'nasm')
# dependencies for rust opennow-streamer: cargo gstreamer gst-plugins-base-libs gst-plugins-bad-libs gst-libav gst-plugins-{good|bad|ugly}
provides=('opennow')
conflicts=('opennow-appimage')
arch=('x86_64')
source=(opennow-${pkgver}.tar.gz::https://github.com/OpenCloudGaming/OpenNOW/archive/refs/tags/v${_pkgver}.tar.gz)

sha256sums=('fa347896c1649d1fd05794c7ed1895a0feebb02b8d6ad1e4670f2a20c2d04372')

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
}

#test() {
#	cd "$_pkgname-$_pkgver"
#	ctest --test-dir build/opennow-qt --output-on-failure
#}

package() {
	cd "$_pkgname-$_pkgver"
	DESTDIR="${pkgdir}" cmake --install build/opennow-qt

	# misc (licence)
	install -m644 -D -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
