# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
pkgname=telegram-desktop-light
pkgver=0.9.56
pkgrel=2
_qtver=5.6.0
pkgdesc='Official desktop version of Telegram messaging app. Uses system libraries.'
arch=('i686' 'x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=(
	'ffmpeg'
	'icu'
	'libmng'
	'libxkbcommon-x11'
	'libinput'
	'libproxy'
	'openal'
	# Detected by namcap
	'tslib'
	'xcb-util-wm'
	'xcb-util-keysyms'
	'xcb-util-image'
	'jasper'
	'hicolor-icon-theme'
)
makedepends=(
	# Dependencies moved from 'depends'
	'libva'
	'mtdev'
	'libexif'
	'libwebp'
	# Build dependencies
	'libunity'
	'libappindicator-gtk2'
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
	'libjpeg-turbo'
	'libpng'
	'libtiff'
	'libmng'
	'libwebp'
	# Normal make-depends
	'mtdev'
	'libfbclient'
	'libmariadbclient'
	'sqlite'
	'unixodbc'
	'postgresql-libs'
	'alsa-lib'
	'gst-plugins-base-libs'
	'gtk2'
	'libpulse'
	'cups'
	'freetds'
)
optdepends=(
	'libappindicator-gtk2: to hide Telegram in the tray bar (GTK2-based desktop environment)'
	'libappindicator-gtk3: to hide Telegram in the tray bar (GTK3-based desktop environment)'
	'libappindicator-sharp: to hide Telegram in the tray bar (Unity-based desktop environment)'
	'pulseaudio-jack: JACK support behind PulseAudio'
)

# Name of the archive. To use in case of broken things.
# Release based on specific commit
#_commit_hash="a058b6e3a6a99e3815d2cbfecce96b32307bb90d"
#_archive="${_commit_hash}"
# Release based on version tag
_archive="v$pkgver"

source=(
	"tdesktop-${pkgver}.tar.gz::https://github.com/telegramdesktop/tdesktop/archive/${_archive}.tar.gz"
	#"http://download.qt.io/official_releases/qt/${_qtver%.*}/$_qtver/submodules/qt5-opensource-src-$_qtver.tar.xz"
	"http://download.qt.io/official_releases/qt/${_qtver%.*}/$_qtver/submodules/qtbase-opensource-src-$_qtver.tar.xz"
	"http://download.qt.io/official_releases/qt/${_qtver%.*}/$_qtver/submodules/qtimageformats-opensource-src-$_qtver.tar.xz"
	"breakpad.tar.gz::https://chromium.googlesource.com/breakpad/breakpad/+archive/master.tar.gz"
	"breakpad-lss.tar.gz::https://chromium.googlesource.com/linux-syscall-support/+archive/master.tar.gz"
	"telegramdesktop.desktop"
	"tg.protocol"
)
noextract=(
	'breakpad.tar.gz'
	'breakpad-lss.tar.gz'
)
sha256sums=('69ed7364e87f8f24d6f68ddc0a5b98dfd5dae74ecc93e456cede9e65878ef404'
            '6efa8a5c559e92b2e526d48034e858023d5fd3c39115ac1bfd3bb65834dbd67a'
            '2c854275a689a513ba24f4266cc6017d76875336671c2c8801b4b7289081bada'
            'SKIP'
            'SKIP'
            'bfc45add9e72ecc8ad07e2b4fdb6a4f52eb1cf284f76c3379efd201e78def63a'
            'd4cdad0d091c7e47811d8a26d55bbee492e7845e968c522e86f120815477e9eb')

prepare() {
	ln -sf "$srcdir/tdesktop-${_archive#v}" "$srcdir/tdesktop"
	cd "$srcdir/tdesktop"

	mkdir -p "$srcdir/Libraries"

	# Extract QT5 in the proper folders and patch it properly
	local qt_patch_file="$srcdir/tdesktop/Telegram/Patches/qtbase_${_qtver//./_}.diff"
	local qt_build_dir="$srcdir/Libraries/qt_${_qtver//./_}"
	if [ "$qt_patch_file" -nt "$qt_build_dir" ]; then
		rm -rf "$qt_build_dir"
		mkdir -p "$qt_build_dir"
		#mv "$srcdir/qt-everywhere-opensource-src-$_qtver" "$srcdir/Libraries/QtStatic"
		mv "$srcdir/qtbase-opensource-src-$_qtver" "$qt_build_dir/qtbase"
		mv "$srcdir/qtimageformats-opensource-src-$_qtver" "$qt_build_dir/qtimageformats"
		cd "$qt_build_dir/qtbase"
		patch -p1 -i "$qt_patch_file"
	fi

	# Extract breakpad manually in the proper folder
	rm -rf "$srcdir/Libraries/breakpad/"
	mkdir -p "$srcdir/Libraries/breakpad/src/third_party/lss"
	bsdtar -xf "$srcdir/breakpad.tar.gz" -C "$srcdir/Libraries/breakpad"
	bsdtar -xf "$srcdir/breakpad-lss.tar.gz" -C "$srcdir/Libraries/breakpad/src/third_party/lss"

	# Fix defines and paths in Telegram Desktop project file
	sed -i 's/CUSTOM_API_ID//g' "$srcdir/tdesktop/Telegram/Telegram.pro"
	sed -i 's,LIBS += /usr/local/lib/libxkbcommon.a,,g' "$srcdir/tdesktop/Telegram/Telegram.pro"
	sed -i 's,LIBS += /usr/local/lib/libz.a,LIBS += -lz,g' "$srcdir/tdesktop/Telegram/Telegram.pro"
	sed -i "s,/usr/local/tdesktop/Qt-5.6.0,$srcdir/qt,g" "$srcdir/tdesktop/Telegram/Telegram.pro"

	(
		echo "DEFINES += TDESKTOP_DISABLE_AUTOUPDATE"
		echo "DEFINES += TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME"
		echo 'INCLUDEPATH += "/usr/lib/glib-2.0/include"'
		echo 'INCLUDEPATH += "/usr/lib/gtk-2.0/include"'
		echo 'INCLUDEPATH += "/usr/include/opus"'
		echo 'LIBS += -lcrypto -lssl'
	) >> "$srcdir/tdesktop/Telegram/Telegram.pro"
}

build() {
	# Use patched QT
	local qt_build_dir="$srcdir/Libraries/qt_${_qtver//./_}"
	cd "$qt_build_dir/qtbase"
	./configure \
		-prefix "$srcdir/qt" \
		-release \
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
		-no-opengl \
		-static \
		-nomake examples \
		-nomake tests \
		-verbose
	make
	make install
	# Add our QT5 to PATH
	export PATH="$srcdir/qt/bin:$PATH"

	# Build QT5 imageformats module
	cd "$qt_build_dir/qtimageformats"
	qmake
	make
	make install

	# Build breakpad
	cd "$srcdir/Libraries/breakpad"
	./configure
	make

	# Build codegen_style
	mkdir -p "$srcdir/tdesktop/Linux/obj/codegen_style/Debug"
	cd "$srcdir/tdesktop/Linux/obj/codegen_style/Debug"
	qmake QT_TDESKTOP_PATH=${srcdir}/qt QT_TDESKTOP_VERSION=${_qtver} \
		CONFIG+=debug \
		../../../../Telegram/build/qmake/codegen_style/codegen_style.pro
	make

	# Build codegen_numbers
	mkdir -p "$srcdir/tdesktop/Linux/obj/codegen_numbers/Debug"
	cd "$srcdir/tdesktop/Linux/obj/codegen_numbers/Debug"
	qmake QT_TDESKTOP_PATH=${srcdir}/qt QT_TDESKTOP_VERSION=${_qtver} \
		CONFIG+=debug \
		../../../../Telegram/build/qmake/codegen_numbers/codegen_numbers.pro
	make

	# Build MetaLang
	mkdir -p "$srcdir/tdesktop/Linux/DebugIntermediateLang"
	cd "$srcdir/tdesktop/Linux/DebugIntermediateLang"
	qmake QT_TDESKTOP_PATH=${srcdir}/qt QT_TDESKTOP_VERSION=${_qtver} \
		CONFIG+=debug "../../Telegram/MetaLang.pro"
	make

	# Prepare for Telegram Desktop
	mkdir -p "$srcdir/tdesktop/Linux/ReleaseIntermediate"
	cd "$srcdir/tdesktop/Linux/ReleaseIntermediate"

	# Generate missing dependencies
	./../codegen/Debug/codegen_style \
		"-I./../../Telegram/Resources" \
		"-I./../../Telegram/SourceFiles" \
		"-o./../../Telegram/GeneratedFiles/styles" \
		all_files.style \
		--rebuild
	./../codegen/Debug/codegen_numbers \
		"-o./../../Telegram/GeneratedFiles" \
		"./../../Telegram/Resources/numbers.txt"
	./../DebugLang/MetaLang \
		-lang_in ./../../Telegram/Resources/langs/lang.strings \
		-lang_out ./../../Telegram/GeneratedFiles/lang_auto

	# Finally, build Telegram
	qmake QT_TDESKTOP_PATH=${srcdir}/qt QT_TDESKTOP_VERSION=${_qtver} \
		CONFIG+=release "../../Telegram/Telegram.pro"
	make
}

package() {
	install -dm755 "$pkgdir/usr/bin"
	install -m755 "$srcdir/tdesktop/Linux/Release/Telegram" "$pkgdir/usr/bin/telegram-desktop"

	install -d "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"

	install -d "$pkgdir/usr/share/kde4/services"
	install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kde4/services/tg.protocol"

	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

		install -d "$icon_dir"
		install -m644 "$srcdir/tdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram.png"
	done
}
