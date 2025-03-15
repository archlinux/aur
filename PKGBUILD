# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Maintainer: claymorwan <claymorwan@fembois.dev>

_submodules=("libshijima" "libshimejifinder" "cpp-httplib")

pkgname='shijima-qt'
pkgver='0.0.4'
_srcName="Shijima-Qt-$pkgver"
pkgrel='1'
pkgdesc='Cross-platform shimeji simulation Desktop pets on any device.'
arch=('x86_64')
license=('GPL-3.0-only')
url='https://github.com/pixelomer/Shijima-Qt'
depends=(
  'qt6-base'
  'qt6-multimedia'
  'libunarr'
)
makedepends=(
	'git'
	'pkgconfig'
	'libarchive'
	'xcb-util-cursor'
)
source=(
	"$pkgname.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('c8cd69cedd5f3c605d709c36e953fddb08d7ad3a088ae2a854606d9b51264a8a')


prepare() {
	cd "$srcdir/$_srcName"
	rm -rf libshijima libshimejifinder cpp-httplib
	# Manual way to clone the submodules
	for _sub in ${_submodules[@]}; do
		if [ $_sub != "cpp-httplib" ]; then
			git clone https://github.com/pixelomer/$_sub.git
		else
			git clone https://github.com/yhirose/$_sub.git
		fi
		cd $_sub
		git submodule update --init --recursive
		cd ..
	done
}

build() {
	cd "$srcdir/$_srcName"
	CONFIG=release make -j8
}

package() {
	cd "$srcdir/$_srcName"

	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/usr/share/applications/"
	install -d "$pkgdir/usr/share/icons/"

	install -Dm644 $pkgname -t "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/icons/$pkgname.png"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd licenses
	for _file in *; do
		if [ -f "$_file" ]; then
			install -Dm644 $_file "$pkgdir/usr/share/licenses/$pkgname/$_file"
		fi
	done

	install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$pkgname.desktop << EOF
[Desktop Entry]
Name=Shijima-Qt
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Comment=Cross-platform shimeji simulation for desktop
EOF
}
