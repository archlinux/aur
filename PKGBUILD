# Maintainer: solsTiCe d'Hiver <solsticedhiver@gmail.com>
pkgname=opennow
_pkgname=OpenNOW
pkgver=0.5.2
#_pkgver=0.5.3-nightly.47.1
_pkgver=$pkgver
pkgrel=2
pkgdesc="custom GeForce Now client"
url="https://opennow.zortos.me/"
license=('MIT')
depends=('gtk3' 'cairo' 'pango' 'mesa' 'dbus' 'libx11' 'at-spi2-core' 'hicolor-icon-theme' 'nss' 'nspr' 'alsa-lib'
	'electron42>=42.3.3' 'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-bad-libs' 'gst-libav' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly')
makedepends=('npm' 'imagemagick' 'libxcrypt-compat' 'cargo')
# dependencies for rust opennow-streamer: cargo gstreamer gst-plugins-base-libs gst-plugins-bad-libs gst-libav gst-plugins-{good|bad|ugly}
# we could have avoided building and installing opennow-streamer for now because it is not avaiable and used on linux
provides=('opennow')
conflicts=('opennow-appimage')
arch=('x86_64')
options=(!strip)
source=(opennow-${pkgver}.tar.gz::https://github.com/OpenCloudGaming/OpenNOW/archive/refs/tags/v${_pkgver}.tar.gz
	opennow.desktop opennow)

sha256sums=('5c05ed4122150eb5f1326bcdd3b457db1390c8c30dd670516c35e1130c5ea128'
            '2ab63a0c3b39b7220bd1d16d5a61daf2578c8b3dadbbbcacd4287d8b568cd513'
            '69483db477be806334fc7fc03933d7f5ed866be15e7157b7a18895e370c946e8')

prepare() {
	cd "$_pkgname-$_pkgver"
	cd opennow-stable
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	# fix: remove call to ensure-electron-installed.mjs
	sed -i -e '/ensure-electron-installed.mjs/d' package.json
	npm install --cache "${srcdir}/npm/cache"
}

build() {
	cd "$_pkgname-$_pkgver"
	npm run build
	npm run native:build
	mkdir hicolor || :
	# create a set of icons from huge logo.png
	for i in 8x8 16x16 20x20 22x22 24x24 32x32 36x36 40x40 42x42 48x48 64x64 72x72 80x80 96x96 128x128 192x192 256x256 384x384 512x512 1024x1024; do
		_dir="hicolor/${i}/apps"
		mkdir -p "${_dir}"
	 	magick logo.png -resize "${i}" "${_dir}/opennow.png"
	done
}

package() {
	cd "$_pkgname-$_pkgver"
	mkdir -p "${pkgdir}/usr/lib/opennow/native/opennow-streamer/bin"
	mkdir -p "${pkgdir}/usr/lib/opennow/opennow-stable"
	cp -a opennow-stable/dist-electron ${pkgdir}/usr/lib/opennow/opennow-stable
	# force/set the app name to keep the previously created config dir
	sed -i ${pkgdir}/usr/lib/opennow/opennow-stable/dist-electron/main/index.js -e '/import.*app/a app.setVersion("'$_pkgver'")\napp.setName("opennow-stable")'
	cp -a opennow-stable/dist ${pkgdir}/usr/lib/opennow/opennow-stable
	cp -a opennow-stable/package.json ${pkgdir}/usr/lib/opennow/opennow-stable
	# only install the required npm module
	npm install --cache "${srcdir}/npm/cache" --omit=dev --prefix "${pkgdir}/usr/lib/opennow/opennow-stable"
	cp -a native/opennow-streamer/bin/opennow-streamer ${pkgdir}/usr/lib/opennow/native/opennow-streamer/bin/
	# misc (licence, dekstop)
	install -m644 -D -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	install -m 644 -D -t "${pkgdir}/usr/share/applications/" "${srcdir}/opennow.desktop"
	# icons
	mkdir -p "${pkgdir}/usr/share/icons"
	cp -a hicolor "${pkgdir}/usr/share/icons"
	# wrapper launcher
	install -m 755 -D -t "${pkgdir}/usr/bin" "${srcdir}/opennow"
}
