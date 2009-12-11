# $Id: $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=chromium
pkgver=4.0.267.0
pkgrel=2
pkgdesc='An open-source browser project that aims to build a safer, faster, and more stable way for all users to experience the web'
arch=('i686' 'x86_64')
url='http://www.chromium.org/'
license=('BSD')
depends=('nss' 'gconf' 'alsa-lib' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('python' 'perl' 'gperf')
provides=('chromium-browser')
conflicts=('chromium-browser')
install='chromium.install'
source=("ftp://ftp.archlinux.org/other/chromium/chromium-${pkgver}.tar.xz"
        'chromium.desktop'
        'drop_sse2.patch')
md5sums=('c6498cf5586205981dedf244460dea50'
         '312df68330d6e288cbb2260bad620a32'
         'a4a920d7b198c0a2f6e39d60ec75abd5')

build() {
	cd ${srcdir}/chromium-${pkgver}

	export GYP_GENERATORS="make"
	export BUILDTYPE="Release"
	export GYP_DEFINES='gcc_version=44 no_strict_aliasing=1 linux_sandbox_path=/usr/lib/chromium/chromium-sandbox'

	# i686 does not include SSE2
	# see http://code.google.com/p/chromium/issues/detail?id=9007
	patch -p0 -i ${srcdir}/drop_sse2.patch || return 1

	if [ "${CARCH}" = 'x86_64' ]; then
		GYP_DEFINES="${GYP_DEFINES} target_arch=x64"
	fi

	export PATH=./depot_tools/:$PATH
	gclient runhooks --force || return 1

	cd src
	make chrome chrome_sandbox || return 1
}

package() {
	cd ${srcdir}/chromium-${pkgver}

	install -m 0755 -D src/out/Release/chrome				${pkgdir}/usr/lib/chromium/chromium
	install -m 4555 -o root -g root -D src/out/Release/chrome_sandbox	${pkgdir}/usr/lib/chromium/chromium-sandbox
	install -m 0644 -D src/out/Release/chrome.pak				${pkgdir}/usr/lib/chromium/chrome.pak
	install -m 0644 -D src/out/Release/libffmpegsumo.so			${pkgdir}/usr/lib/chromium/libffmpegsumo.so
	install -m 0644 -D src/out/Release/product_logo_48.png			${pkgdir}/usr/lib/chromium/product_logo_48.png
	install -m 0755 -D src/out/Release/xdg-settings				${pkgdir}/usr/lib/chromium/xdg-settings

	cp -a src/out/Release/locales src/out/Release/resources			${pkgdir}/usr/lib/chromium/
	find ${pkgdir}/usr/lib/chromium/ -name '*.d' -type f -delete

	install -m 0644 -D src/out/Release/chrome.1				${pkgdir}/usr/share/man/man1/chromium.1

	install -m 0644 -D ${srcdir}/chromium.desktop				${pkgdir}/usr/share/applications/chromium.desktop
	for size in 16 32 48 256; do
		install -m 0644 -D \
			src/chrome/app/theme/chromium/product_logo_${size}.png \
										${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png
	done
	install -m 0755 -d 							${pkgdir}/usr/bin
	ln -sf /usr/lib/chromium/chromium 					${pkgdir}/usr/bin/chromium

	install -m 0644 -D src/LICENSE						${pkgdir}/usr/share/licenses/chromium/LICENSE
}

# create source tar
# 1) adjust pkgver
# 2) . PKGBUILD
# 3) _source
_source() {
	# see http://src.chromium.org/svn/trunk/src/tools/export_tarball/export_tarball.py
	local _nonessential_dirs=(
		'src/chrome/test/data'
		'src/chrome/tools/test/reference_build'
		'src/gears/binaries'
		'src/net/data/cache_tests'
		'src/o3d/documentation'
		'src/o3d/samples'
		'src/third_party/lighttpd'
		'src/third_party/WebKit/LayoutTests'
		'src/webkit/data/layout_tests'
		'src/webkit/tools/test/reference_build'
	)

	local _current=$(pwd)
	local _tmp=$(mktemp -d)
	local _target=$(mktemp -d)

	cd $_tmp

	svn co http://src.chromium.org/svn/trunk/tools/depot_tools/ depot_tools

	export PATH=./depot_tools/:$PATH
	gclient config http://src.chromium.org/svn/releases/$pkgver/src
	sed -i '15i\      "src/third_party/WebKit/LayoutTests": None,' .gclient
	gclient sync --nohooks

	mkdir -p $_target/chromium-$pkgver
	cp -a .gclient $_target/chromium-$pkgver
	svn export depot_tools $_target/chromium-$pkgver/depot_tools
	gclient export $_target/chromium-$pkgver

	for i in ${_nonessential_dirs[@]}; do
		rm -rf $_target/chromium-$pkgver/$i
	done

	cd $_target
	tar -cvJf $_current/chromium-$pkgver.tar.xz chromium-$pkgver
	cd $_current

	rm -rf $_target $_tmp
}
