# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
pkgname=telegram-desktop-light
pkgver=0.9.44
pkgrel=1
_qtver=5.5.1
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
source=(
	"tdesktop.tar.gz::https://github.com/telegramdesktop/tdesktop/archive/v$pkgver.tar.gz"
	"http://download.qt.io/official_releases/qt/${_qtver%.*}/$_qtver/submodules/qt5-opensource-src-$_qtver.tar.xz"
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
sha256sums=(
	'c75aa102dd37c37ab1511213a838c8a2ed355b88f8a75693dda2c96485f0a249'
	'463878353c92921e51913de5618cc100231ad8ebcf78c69eaab24123f5df033d'
	'dfa4e8a4d7e4c6b69285e7e8833eeecd819987e1bdbe5baa6b6facd4420de916'
	'c97fee00c602f9f089fea480546d6e9d61a2b2297c2f163bfd9f8aba92b754a5'
	'SKIP'
	'SKIP'
	'adb111ad10872e2858c8ccdd8645a1566736dec8d48deb50a9a7c0fbcae5cfb0'
	'd4cdad0d091c7e47811d8a26d55bbee492e7845e968c522e86f120815477e9eb'
)

prepare() {
	ln -sf "$srcdir/tdesktop-$pkgver" "$srcdir/tdesktop"
	cd "$srcdir/tdesktop"
	
	mkdir -p "$srcdir/Libraries"

	local qt_patch_file="$srcdir/tdesktop/Telegram/_qtbase_${_qtver//./_}_patch.diff"
	if [ "$qt_patch_file" -nt "$srcdir/Libraries/QtStatic" ]; then
		rm -rf "$srcdir/Libraries/QtStatic"
		mv "$srcdir/qt-everywhere-opensource-src-$_qtver" "$srcdir/Libraries/QtStatic"
		mv "$srcdir/qtbase-opensource-src-$_qtver" "$srcdir/Libraries/QtStatic/qtbase"
		mv "$srcdir/qtimageformats-opensource-src-$_qtver" "$srcdir/Libraries/QtStatic/qtimageformats"
		cd "$srcdir/Libraries/QtStatic/qtbase"
		patch -p1 -i "$qt_patch_file"
	fi

	# Extract breakpad manually in the proper folder
	rm -rf "$srcdir/Libraries/breakpad/"
	mkdir -p "$srcdir/Libraries/breakpad/src/third_party/lss"
	bsdtar -xf "$srcdir/breakpad.tar.gz" -C "$srcdir/Libraries/breakpad"
	bsdtar -xf "$srcdir/breakpad-lss.tar.gz" -C "$srcdir/Libraries/breakpad/src/third_party/lss"
	
	sed -i 's/CUSTOM_API_ID//g' "$srcdir/tdesktop/Telegram/Telegram.pro"
	sed -i 's,LIBS += /usr/local/lib/libxkbcommon.a,,g' "$srcdir/tdesktop/Telegram/Telegram.pro"
	sed -i 's,LIBS += /usr/local/lib/libz.a,LIBS += -lz,g' "$srcdir/tdesktop/Telegram/Telegram.pro"
	
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
	cd "$srcdir/Libraries/QtStatic"
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

	# Build breakpad
	cd "$srcdir/Libraries/breakpad"
	./configure
	make
	
	# Build MetaStyle
	mkdir -p "$srcdir/tdesktop/Linux/DebugIntermediateStyle"
	cd "$srcdir/tdesktop/Linux/DebugIntermediateStyle"
	qmake CONFIG+=debug "../../Telegram/MetaStyle.pro"
	make
	
	# Build MetaLang
	mkdir -p "$srcdir/tdesktop/Linux/DebugIntermediateLang"
	cd "$srcdir/tdesktop/Linux/DebugIntermediateLang"
	qmake CONFIG+=debug "../../Telegram/MetaLang.pro"
	make
	
	# Build Telegram Desktop
	mkdir -p "$srcdir/tdesktop/Linux/ReleaseIntermediate"
	cd "$srcdir/tdesktop/Linux/ReleaseIntermediate"
	
	qmake CONFIG+=release "../../Telegram/Telegram.pro"
	local pattern="^PRE_TARGETDEPS +="
	grep "$pattern" "$srcdir/tdesktop/Telegram/Telegram.pro" | sed "s/$pattern//g" | xargs make
	
	qmake CONFIG+=release "../../Telegram/Telegram.pro"
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
		install -m644 "$srcdir/tdesktop/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram-desktop.png"
	done
}
