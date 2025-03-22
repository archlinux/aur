#Maintainer: claymorwan <claymorwan@fembois.dev>

_pkgname="shijima-qt"

pkgname=shijima-qt-git
pkgver=0.1.0.r6.gf4099eb
pkgrel=1
pkgdesc="Cross-platform shimeji simulation for desktop"
arch=(x86_64 aarch64)
url="https://github.com/pixelomer/Shijima-Qt"
license=('GPL-3.0-only')
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
	'imagemagick'
	'cmake'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
prepare() {
	cd "$srcdir/$pkgname"
	git submodule set-url libshijima https://github.com/pixelomer/libshijima
	git submodule set-url libshimejifinder https://github.com/pixelomer/libshimejifinder
	git submodule set-url cpp-httplib https://github.com/yhirose/cpp-httplib/
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$pkgname"
	CONFIG=release make -j8
	
	# Convert image
	magick "$_pkgname.ico" "$_pkgname.png"
}

package() {
	cd "$srcdir/$pkgname"

	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/usr/share/applications/"

	install -Dm644 $_pkgname -t "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin/$_pkgname"

	# Icon
	install -D "$_pkgname.png" "$pkgdir/usr/share/icons/$_pkgname.png"
	
	# licenses
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	cd licenses
	for _file in *; do
		if [ -f "$_file" ]; then
			install -Dm644 $_file "$pkgdir/usr/share/licenses/$_pkgname/$_file"
		fi
	done

	install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop << EOF
[Desktop Entry]
Name=Shijima-Qt
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=Cross-platform shimeji simulation for desktop
EOF
}

