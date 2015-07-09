pkgname=telegram-desktop
pkgver=0.8.38
pkgrel=3
_qtver=5.4.0
pkgdesc='Official desktop version of Telegram messaging app.'
arch=('i686' 'x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('ffmpeg' 'icu' 'jasper' 'libexif' 'libmng' 'libwebp' 'libxkbcommon-x11' 'mtdev' 'openal' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('git' 'patch' 'libunity' 'libappindicator-gtk2' 'xorg-server-xvfb')
source=("http://download.qt-project.org/official_releases/qt/${_qtver%.*}/$_qtver/single/qt-everywhere-opensource-src-$_qtver.tar.gz"
	"disable-custom-scheme-linux.patch"
	"disable-updater.patch"
	"telegramdesktop.desktop"
	"tdesktop::git+https://github.com/telegramdesktop/tdesktop.git#commit=cf119568a12404cfdf3607a14bccc0aa51458d09")
sha256sums=('1739633424bde3d89164ae6ff1c5c913be38b9997e451558ef873aac4bbc408a'
	    'c6b59d85db9792ee95c31d26734db7f6e67ce892d78aa58d2fff876a7ffd35ae'
	    'f00fc4da6122195d48ff88fe6e4fd96f78fbf66f3b05692f863d501bff6e9196'
	    'fb466e51758ba409cd0b9da8147c6854430e8e7f485476d5107b3bf572a82777'
	    'SKIP')
install="$pkgname.install"

# Based on PKGBUILD for telegram-desktop-git

prepare() {
	cd "$srcdir/tdesktop"
	patch -p1 -i "$srcdir/disable-custom-scheme-linux.patch"
	patch -p1 -i "$srcdir/disable-updater.patch"
	
	if ! [ -d "$srcdir/Libraries" ]; then
		mkdir "$srcdir/Libraries"
		mv "$srcdir/qt-everywhere-opensource-src-$_qtver" "$srcdir/Libraries/QtStatic"
		cp "$srcdir/tdesktop/Telegram/_qt_${_qtver//./_}_patch.diff" "$srcdir/Libraries/QtStatic"
		cd "$srcdir/Libraries/QtStatic"
		patch -p1 -i "_qt_${_qtver//./_}_patch.diff"
		#git apply "_qt_${_qtver//./_}_patch.diff"
	fi
	
	sed -i 's/CUSTOM_API_ID//g' "$srcdir/tdesktop/Telegram/Telegram.pro"
	
	echo "DEFINES += TDESKTOP_DISABLE_AUTOUPDATE" >> "$srcdir/tdesktop/Telegram/Telegram.pro"
	
	(
		echo 'INCLUDEPATH += "/usr/lib/glib-2.0/include"'
		echo 'INCLUDEPATH += "/usr/lib/gtk-2.0/include"'
		echo 'INCLUDEPATH += "/usr/include/opus"'
	) >> "$srcdir/tdesktop/Telegram/Telegram.pro"
	
	# FIXME qmake (for Telegram.pro) does not generate the correct paths if the files does not exists
	#mkdir -p "$srcdir"/tdesktop/Telegram/GeneratedFiles
	#awk -v srcdir="$srcdir" '$1 == "PRE_TARGETDEPS" { for (i=3; i <= NF; i++) print "touch -t 197001010000", srcdir "/tdesktop/Telegram/" $i }' "$srcdir"/tdesktop/Telegram/Telegram.pro | sh -s
}

build() {
	# Building patched Qt
	cd "$srcdir/Libraries/QtStatic"
	./configure -prefix "$srcdir/qt" -release -opensource -confirm-license -qt-xcb -no-opengl -static -nomake examples -nomake tests -skip qtquick1 -skip qtdeclarative
	make module-qtbase module-qtimageformats
	make module-qtbase-install_subtargets module-qtimageformats-install_subtargets
	
	export PATH="$srcdir/qt/bin:$PATH"
	
	mkdir -p "$srcdir/tdesktop/Linux/"{Debug,Release}Intermediate{Style,Emoji,Lang,Updater,}
	
	local build_type x
	for build_type in debug release; do
		for x in Style Lang; do
			cd "$srcdir/tdesktop/Linux/${build_type^}Intermediate$x"
			qmake CONFIG+="${build_type}" "../../Telegram/Meta$x.pro"
			make
		done
		
		cd "$srcdir/tdesktop/Linux/${build_type^}Intermediate"
		# FIXME: upstream likes broken things
		if ! [ -d "$srcdir/tdesktop/Telegram/GeneratedFiles" ]; then
			qmake CONFIG+="${build_type}" "../../Telegram/Telegram.pro"
			awk '$1 == "PRE_TARGETDEPS" { $1=$2="" ; print }' "$srcdir/tdesktop/Telegram/Telegram.pro" | xargs xvfb-run -a make
		fi
		
		qmake CONFIG+="${build_type}" "../../Telegram/Telegram.pro"
		xvfb-run -a make
	done
}

package() {
	install -dm755 "$pkgdir/usr/bin"
	install -m755 "$srcdir/tdesktop/Linux/Release/Telegram" "$pkgdir/usr/bin/telegram-desktop"
	
	install -d "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/telegramdesktop.desktop" "$pkgdir/usr/share/applications/telegramdesktop.desktop"
	
	local icon_size
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		
		install -d "$icon_dir"
		install -m644 "$srcdir/tdesktop/Telegram/SourceFiles/art/icon${icon_size}.png" "$icon_dir/telegram-desktop.png"
	done
}
