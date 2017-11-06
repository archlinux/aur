# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
pkgname=telegram-desktop-dev
pkgver=1.1.23
pkgrel=1
pkgdesc='Official desktop version of Telegram messaging app. Development release.'
arch=('i686' 'x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=(
	'ffmpeg'
	'icu'
	'libxkbcommon-x11'
	'libproxy'
	'openal'
	'openssl-1.0'
	'xcb-util-wm'
	'xcb-util-keysyms'
	'xcb-util-image'
	'xcb-util-renderutil'
	'hicolor-icon-theme'
)
makedepends=(
	'chrpath'
	'cmake'
	'git'
	'google-breakpad-git'
	'libappindicator-gtk2'
	'libexif'
	'libunity'
	'libva'
	'libwebp'
	'mtdev'
	'python'
	'python2'
	# QT5 build dependencies
	'xcb-util-keysyms'
	'libgl'
	'fontconfig'
	'xcb-util-wm'
	'libxrender'
	'libxi'
	'sqlite'
	'xcb-util-image'
	'harfbuzz-icu'
	'tslib'
	'libinput'
	'libsm'
	'libxkbcommon-x11'
	# For qtimageformats
	'jasper'
	'libjpeg-turbo'
	'libpng'
	'libmng'
	'libtiff'
	'libwebp'
	# For qtwayland
	'wayland'
)
optdepends=(
	'libappindicator-gtk2: to hide Telegram in the tray bar (GTK2-based desktop environment)'
	'libappindicator-gtk3: to hide Telegram in the tray bar (GTK3-based desktop environment)'
	'libappindicator-sharp: to hide Telegram in the tray bar (Unity-based desktop environment)'
	'pulseaudio-jack: JACK support behind PulseAudio'
)
_qt_version=5.6.2
# Hacky way to handle versioning as we wish
_real_version="tag=v$pkgver"
source=(
	"tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#${_real_version}"
	"GSL::git+https://github.com/Microsoft/GSL.git"
	"variant::git+https://github.com/mapbox/variant.git"
	"libtgvoip::git+https://github.com/telegramdesktop/libtgvoip.git"
	"Catch::git+https://github.com/philsquared/Catch.git"
	"https://download.qt.io/official_releases/qt/${_qt_version%.*}/$_qt_version/submodules/qtbase-opensource-src-$_qt_version.tar.xz"
	"https://download.qt.io/official_releases/qt/${_qt_version%.*}/$_qt_version/submodules/qtimageformats-opensource-src-$_qt_version.tar.xz"
	"https://download.qt.io/official_releases/qt/${_qt_version%.*}/$_qt_version/submodules/qtwayland-opensource-src-$_qt_version.tar.xz"
	"git+https://chromium.googlesource.com/external/gyp"
	"telegramdesktop.desktop"
	"tg.protocol"
	# Thanks eduardosm, got from his 'telegram-desktop' AUR package
	"aur-fixes.diff::https://aur.archlinux.org/cgit/aur.git/plain/aur-fixes.diff?h=telegram-desktop"
	"libtgvoip-fixes.diff::https://aur.archlinux.org/cgit/aur.git/plain/libtgvoip-fixes.diff?h=telegram-desktop"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2f6eae93c5d982fe0a387a01aeb3435571433e23e9d9d9246741faf51f1ee787'
            '4fb153be62dac393cbcebab65040b3b9d6edecd1ebbe5e543401b0e45bd147e4'
            '035c3199f4719627b64b7020f0f4574da2b4cb78c6981aba75f27b872d8e6c86'
            'SKIP'
            '41c22fae6ae757936741e63aec3d0f17cafe86b2d6153cdd1d01a5581e871f17'
            'd4cdad0d091c7e47811d8a26d55bbee492e7845e968c522e86f120815477e9eb'
            '5bd1272ba8221eeb1d26b1673093f726e8bf028b1c867b814cd3c552a8a59a36'
            'df86ab21e5eddc3dac46781a2165452ce076e928c2b9d59f340883c13f5d5a02')

prepare() {
	cd "$srcdir/tdesktop"

	mkdir -p "$srcdir/Libraries"

	msg2 "Set up properly QT"
	local qt_patch_file="$srcdir/tdesktop/Telegram/Patches/qtbase_${_qt_version//./_}.diff"
	local qt_src_dir="$srcdir/Libraries/qt${_qt_version//./_}"
	if [ "$qt_patch_file" -nt "$qt_src_dir" ]; then
		rm -rf "$qt_src_dir"
		mkdir "$qt_src_dir"

		mv "$srcdir/qtbase-opensource-src-$_qt_version" "$qt_src_dir/qtbase"
		mv "$srcdir/qtimageformats-opensource-src-$_qt_version" "$qt_src_dir/qtimageformats"
		mv "$srcdir/qtwayland-opensource-src-$_qt_version" "$qt_src_dir/qtwayland"

		cd "$qt_src_dir/qtbase"
		patch -p1 -i "$qt_patch_file"

		# Use the version 1.0 of OpenSSL
		echo "INCLUDEPATH += /usr/include/openssl-1.0" >> "$qt_src_dir/qtbase/src/network/network.pro"
	fi

	msg2 "Set up properly gyp"
	cd "$srcdir/gyp"
	git apply "$srcdir/tdesktop/Telegram/Patches/gyp.diff"
	sed -i 's/exec python /exec python2 /g' "$srcdir/gyp/gyp"

	if [ ! -h "$srcdir/Libraries/gyp" ]; then
		ln -s "$srcdir/gyp" "$srcdir/Libraries/gyp"
	fi

	msg2 "Fix submodules locations"
	cd "$srcdir/tdesktop"
	git submodule init
	git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
	git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
	git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
	git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch"
	git submodule update

	msg2 "Apply Arch-like fixes"
	cd "$srcdir/tdesktop"
	git apply "$srcdir/aur-fixes.diff"
	cd "$srcdir/tdesktop/Telegram/ThirdParty/libtgvoip"
	git apply "$srcdir/libtgvoip-fixes.diff"
}

build() {
	# Build patched Qt
	local qt_src_dir="$srcdir/Libraries/qt${_qt_version//./_}"

	msg2 "Set up properly OpenSSL 1.0"
	export OPENSSL_LIBS='-L/usr/lib/openssl-1.0 -lssl -lcrypto'

	cd "$qt_src_dir/qtbase"
	./configure \
		-prefix "$srcdir/qt" \
		-release \
		-verbose \
		-force-debug-info \
		-opensource \
		-confirm-license \
		-system-zlib \
		-system-libpng \
		-system-libjpeg \
		-system-freetype \
		-system-harfbuzz \
		-system-pcre \
		-system-xcb \
		-system-xkbcommon-x11 \
		-no-gtkstyle \
		-static \
		-nomake examples \
		-nomake tests
		#-no-opengl
	make
	make install
	export PATH="$srcdir/qt/bin:$PATH"

	cd "$qt_src_dir/qtimageformats"
	qmake .
	make
	make install

	cd "$qt_src_dir/qtwayland"
	qmake .
	make
	make install

	# Build Telegram Desktop
	rm -rf "$srcdir/tdesktop/out"
	cd "$srcdir/tdesktop/Telegram/gyp"

	"$srcdir/Libraries/gyp/gyp" \
		-Dlinux_path_qt="$srcdir/qt" \
		-Dlinux_lib_ssl='-L/usr/lib/openssl-1.0 -lssl' \
		-Dlinux_lib_crypto='-L/usr/lib/openssl-1.0 -lcrypto' \
		-Dlinux_lib_icu="-licuuc -licutu -licui18n" \
		-Dlinux_path_opus_include="/usr/include/opus" \
		--depth=. --generator-output=../.. -Goutput_dir=out Telegram.gyp --format=cmake
	cd "$srcdir/tdesktop/out/Release"
	cmake .
	make
	chrpath --delete Telegram
}

package() {
	install -dm755 "$pkgdir/usr/bin"
	install -m755 "$srcdir/tdesktop/out/Release/Telegram" "$pkgdir/usr/bin/telegram-desktop"

	install -d "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"

	install -d "$pkgdir/usr/share/kde4/services"
	install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kde4/services/tg.protocol"

	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

		install -d "$icon_dir"
		install -m644 "$srcdir/tdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram-desktop.png"
	done
}
