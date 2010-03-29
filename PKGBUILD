# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium
pkgver=5.0.342.8
pkgrel=1
pkgdesc='The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser.'
arch=('i686' 'x86_64')
url='http://www.chromium.org/'
license=('BSD')
depends=('nss' 'gconf' 'alsa-lib' 'xdg-utils' 'hicolor-icon-theme' 'bzip2' 'libxslt'
         'libevent' 'libxss')
makedepends=('python' 'perl' 'gperf' 'yasm' 'mesa')
provides=('chromium-browser')
conflicts=('chromium-browser')
install='chromium.install'
source=("ftp://ftp.archlinux.org/other/chromium/chromium-${pkgver}.tar.xz"
        'chromium.desktop' 'chromium.sh'
        'drop_sse2.patch' 'ffmpeg_branding_mime.patch' 'libpng-1.4.patch')
md5sums=('66d6ff274b7a2d0a8e66ad2621a950cb'
         '897de25e9c25a01f8b1b67abe554a6b7'
         '93cd6f5f53b15546dc9d3de49118534c'
         'dfbc18bb26dffa2dc6d4d3a857730902'
         'ae9e26e6c2d164e6af0e513dae2273a3'
         'bb75bfdfe85db26639abbea9054b85f9')

build() {
	cd ${srcdir}/chromium-${pkgver}

	export GYP_GENERATORS='make'
	export BUILDTYPE='Release'
	# we need to disable system_ssl until "next protocol negotiation" support
	# is available in our nss package
	# see https://bugzilla.mozilla.org/show_bug.cgi?id=547312
	export GYP_DEFINES="gcc_version=44 \
		no_strict_aliasing=1 \
		linux_sandbox_path=/usr/lib/chromium/chromium-sandbox \
		linux_strip_binary=1 \
		release_extra_cflags='${CFLAGS}' \
		ffmpeg_branding=Chrome \
		use_system_libjpeg=1 \
		use_system_libxslt=1 \
		use_system_bzip2=1 \
		use_system_zlib=1 \
		use_system_libpng=1 \
		use_system_ffmpeg=0 \
		use_system_yasm=1 \
		use_system_libevent=1 \
		use_system_ssl=0"

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
	install -m 0644 -D src/out/Release/libffmpegsumo.so \
		${pkgdir}/usr/lib/chromium/libffmpegsumo.so
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
