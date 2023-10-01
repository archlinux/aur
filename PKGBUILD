# Maintainer: westpain <homicide@disroot.org>
# Co-maintainer: DiamivaeBro <assassinssamsa@gmail.com>
# Binary provider: DiamivaeBro <assassinssamsa@gmail.com>
pkgname=ayugram-desktop-bin
pkgver=4.9.4
pkgrel=4
pkgdesc="Unofficial desktop version of Telegram messaging app with ToS breaking features in mind - Static binaries"
arch=(x86_64)
url="https://github.com/AyuGram/AyuGramDesktop"
license=(GPL3)
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
	 'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash'
	 'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
	 'openssl' 'protobuf' 'glib2' 'libsigc++-3.0')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson' 'chrpath'
	     'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
	     'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'libsigc++-3.0')
optdepends=('webkit2gtk: embedded browser features'
	    'xdg-desktop-portal: desktop integration')
# Sources
source=(
	com.ayugram.desktop.desktop
	tg.protocol
	$url/raw/dev/Telegram/Resources/art/icon{16,32,48,64,128,256,512}.png
	https://mirror.killarious.org/ayugram/archlinux/ayugram-desktop
)

# Checksums
sha256sums=('SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP'
	    'SKIP')
# Some installation information
install="$pkgname.install"

package() {

	cd "$srcdir/"

	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	# Program
	install -Dm755 "$srcdir/ayugram-desktop" "$pkgdir/usr/bin/ayugram-desktop"

	# Remove RPATH informations
	chrpath --delete "$pkgdir/usr/bin/ayugram-desktop"

	# Desktop launcher
	install -Dm644 "$srcdir/icon256.png" "$pkgdir/usr/share/pixmaps/ayugram.png"
	install -Dm644 "$srcdir/com.ayugram.desktop.desktop" "$pkgdir/usr/share/applications/com.ayugram.desktop.desktop"

	# KDE5 & KDE4 protocol file
	install -d "$pkgdir/usr/share/kservices5"
	install -d "$pkgdir/usr/share/kde4/services"
	install -m644 "$srcdir/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"
	ln -s "/usr/share/kservices5/tg.protocol" "$pkgdir/usr/share/kde4/services"

	# Icons
	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "$icon_dir"
		install -m644 "$srcdir/icon${icon_size}.png" "$icon_dir/ayugram.png"
	done
}
