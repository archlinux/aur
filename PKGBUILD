# Maintainer: solsTiCe d'Hiver <solsticedhiver@gmail.com>
pkgname=opennow
_pkgname=OpenNOW
pkgver=0.5.1
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
source=(opennow-${pkgver}.tar.gz::https://github.com/OpenCloudGaming/OpenNOW/archive/refs/tags/v${pkgver}.tar.gz
	opennow.desktop opennow)

sha256sums=('f00a9581f409a3a85509670c52864924a5d9f178c272ca21a614d251292e00ab'
            '2ab63a0c3b39b7220bd1d16d5a61daf2578c8b3dadbbbcacd4287d8b568cd513'
            'eaa15b0e4d73629f9d51f6bb2604f7c1a3e835dbc807a8b93ab669bd41b9a280')

prepare() {
	cd "$_pkgname-$pkgver"
	cd opennow-stable
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	# fix: remove call to ensure-electron-installed.mjs
	sed -i -e '/ensure-electron-installed.mjs/d' package.json
	npm install --cache "${srcdir}/npm/cache"
}

build() {
	cd "$_pkgname-$pkgver"
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
	cd "$_pkgname-$pkgver"
	mkdir -p "${pkgdir}/usr/lib/opennow/native"
	cp -a opennow-stable/dist-electron ${pkgdir}/usr/lib/opennow
	# force/set the app name to keep the previously created config dir
	sed -i ${pkgdir}/usr/lib/opennow/dist-electron/main/index.js -e '/import.*app/a app.setVersion("'$pkgver'")\napp.setName("opennow-stable")'
	cp -a opennow-stable/dist ${pkgdir}/usr/lib/opennow
	cp -a opennow-stable/package.json ${pkgdir}/usr/lib/opennow
	# only install the required npm module
	npm install --cache "${srcdir}/npm/cache" --omit=dev --prefix "${pkgdir}/usr/lib/opennow"
	cp -a native/opennow-streamer/bin/opennow-streamer ${pkgdir}/usr/lib/opennow/native
	# misc (licence, dekstop)
	install -m644 -D -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	install -m 644 -D -t "${pkgdir}/usr/share/applications/" "${srcdir}/opennow.desktop"
	# icons
	mkdir -p "${pkgdir}/usr/share/icons"
	cp -a hicolor "${pkgdir}/usr/share/icons"
	# wrapper launcher
	install -m 755 -D -t "${pkgdir}/usr/bin" "${srcdir}/opennow"
}
