# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=chromium
pkgver=5.0.307.11
pkgrel=1
pkgdesc='The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser.'
arch=('i686' 'x86_64')
url='http://www.chromium.org/'
license=('BSD')
depends=('nss' 'gconf' 'alsa-lib' 'xdg-utils' 'hicolor-icon-theme' 'bzip2' 'libxslt' 'ffmpeg'
         'libevent' 'libxss')
makedepends=('python' 'perl' 'gperf' 'yasm' 'mesa')
provides=('chromium-browser')
conflicts=('chromium-browser')
install='chromium.install'
source=("ftp://ftp.archlinux.org/other/chromium/chromium-${pkgver}.tar.xz"
        'chromium.desktop' 'chromium.sh'
        'drop_sse2.patch' 'ffmpeg_branding_mime.patch' 'libpng-1.4.patch')
md5sums=('74fb683dcb999086d8cf2e59da968319'
         '897de25e9c25a01f8b1b67abe554a6b7'
         '93cd6f5f53b15546dc9d3de49118534c'
         'dfbc18bb26dffa2dc6d4d3a857730902'
         'ae9e26e6c2d164e6af0e513dae2273a3'
         'e3b482665b179e06ff852c58463706a8')

build() {
	cd ${srcdir}/chromium-${pkgver}

	export GYP_GENERATORS='make'
	export BUILDTYPE='Release'
	export GYP_DEFINES="gcc_version=44 \
		no_strict_aliasing=1 \
		linux_sandbox_path=/usr/lib/chromium/chromium-sandbox \
		linux_strip_binary=1 \
		release_extra_cflags='${CFLAGS}' \
		ffmpeg_branding=Chrome \
		use_system_libjpeg=1 \
		use_system_libxslt=1 \
		use_system_bzip2=1 \
		use_system_libpng=1 \
		use_system_ffmpeg=1 \
		use_system_yasm=1 \
		use_system_libevent=1 \
		use_system_ssl=1"

	patch -p0 -i ${srcdir}/ffmpeg_branding_mime.patch || return 1
	# i686 does not include SSE2
	# see http://code.google.com/p/chromium/issues/detail?id=9007
	patch -p0 -i ${srcdir}/drop_sse2.patch || return 1
	# see http://codereview.chromium.org/569009/show
	patch -p0 -i ${srcdir}/libpng-1.4.patch || return 1

	export PATH=./depot_tools/:$PATH
	gclient.py runhooks --force || return 1

	cd src
	make chrome chrome_sandbox || return 1
}

package() {
	cd ${srcdir}/chromium-${pkgver}

	install -m 0755 -D src/out/Release/chrome \
		${pkgdir}/usr/lib/chromium/chromium
	install -m 4555 -o root -g root -D src/out/Release/chrome_sandbox \
		${pkgdir}/usr/lib/chromium/chromium-sandbox
	install -m 0644 -D src/out/Release/chrome.pak \
		${pkgdir}/usr/lib/chromium/chrome.pak
	ln -s /usr/lib/libavcodec.so.52 ${pkgdir}/usr/lib/chromium/libavcodec.so.52
	ln -s /usr/lib/libavformat.so.52 ${pkgdir}/usr/lib/chromium/libavformat.so.52
	ln -s /usr/lib/libavutil.so.50 ${pkgdir}/usr/lib/chromium/libavutil.so.50
	cp -a src/out/Release/locales src/out/Release/resources \
		${pkgdir}/usr/lib/chromium/
	find ${pkgdir}/usr/lib/chromium/ -name '*.d' -type f -delete
	install -m 0644 -D src/out/Release/chrome.1 \
		${pkgdir}/usr/share/man/man1/chromium.1

	install -m 0644 -D ${srcdir}/chromium.desktop \
		${pkgdir}/usr/share/applications/chromium.desktop
	for size in 16 32 48 256; do
		install -m 0644 -D \
			src/chrome/app/theme/chromium/product_logo_${size}.png \
			${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png
	done
	install -m 0755 -D ${srcdir}/chromium.sh \
		${pkgdir}/usr/bin/chromium

	install -m 0644 -D src/LICENSE \
		${pkgdir}/usr/share/licenses/chromium/LICENSE
}
