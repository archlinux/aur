pkgname=telegram-desktop
pkgver=0.9.6
pkgrel=1
_qtver=5.5.0
pkgdesc='Official desktop version of Telegram messaging app.'
arch=('i686' 'x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('ffmpeg' 'icu' 'jasper' 'libexif' 'libmng' 'libwebp' 'libxkbcommon-x11'
	 'libinput' 'libproxy' 'mtdev' 'openal' 'desktop-file-utils'
	 'gtk-update-icon-cache')
makedepends=('patch' 'libunity' 'libappindicator-gtk2' 'xorg-server-xvfb')
source=("tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#tag=v$pkgver"
	"http://download.qt-project.org/official_releases/qt/${_qtver%.*}/$_qtver/single/qt-everywhere-opensource-src-$_qtver.tar.gz"
	"telegramdesktop.desktop"
	"tg.protocol")
sha256sums=('SKIP'
	    'bf3cfc54696fe7d77f2cf33ade46c2cc28841389e22a72f77bae606622998e82'
	    '0e936f964fbaa7392a0c58aa919d6ea8c5f931472e1ab59b437523aa1a1d585c'
	    'd4cdad0d091c7e47811d8a26d55bbee492e7845e968c522e86f120815477e9eb')
install="$pkgname.install"


prepare() {
	cd "$srcdir/tdesktop"
	
	if ! [ -d "$srcdir/Libraries" ]; then
		mkdir "$srcdir/Libraries"
		mv "$srcdir/qt-everywhere-opensource-src-$_qtver" "$srcdir/Libraries/QtStatic"
		cp "$srcdir/tdesktop/Telegram/_qt_${_qtver//./_}_patch.diff" "$srcdir/Libraries/QtStatic"
		cd "$srcdir/Libraries/QtStatic"
		patch -p1 -i "_qt_${_qtver//./_}_patch.diff"
	fi
	
	sed -i 's/CUSTOM_API_ID//g' "$srcdir/tdesktop/Telegram/Telegram.pro"
	sed -i 's,LIBS += /usr/local/lib/libxkbcommon.a,,g' "$srcdir/tdesktop/Telegram/Telegram.pro"
	
	(
		echo "DEFINES += TDESKTOP_DISABLE_AUTOUPDATE"
		echo "DEFINES += TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME"
	) >> "$srcdir/tdesktop/Telegram/Telegram.pro"
	
	(
		echo 'INCLUDEPATH += "/usr/lib/glib-2.0/include"'
		echo 'INCLUDEPATH += "/usr/lib/gtk-2.0/include"'
		echo 'INCLUDEPATH += "/usr/include/opus"'
	) >> "$srcdir/tdesktop/Telegram/Telegram.pro"
}

build() {
	# Build patched Qt
	cd "$srcdir/Libraries/QtStatic"
	./configure -prefix "$srcdir/qt" -release -opensource -confirm-license -qt-xcb -no-opengl -static -nomake examples -nomake tests -skip qtquick1 -skip qtdeclarative
	make module-qtbase module-qtimageformats
	make module-qtbase-install_subtargets module-qtimageformats-install_subtargets
	
	export PATH="$srcdir/qt/bin:$PATH"
	
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
	local pattern="^PRE_TARGETDEPS +\?="
	grep "$pattern" "$srcdir/tdesktop/Telegram/Telegram.pro" | sed "s/$pattern//g" | xargs xvfb-run -a make
	
	qmake CONFIG+=release "../../Telegram/Telegram.pro"
	xvfb-run -a make
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
		install -m644 "$srcdir/tdesktop/Telegram/SourceFiles/art/icon${icon_size}.png" "$icon_dir/telegram-desktop.png"
	done
}
