#Maintainer: Your Name <claymorwan@fembois.dev>

_pkgname="shijima-qt"

pkgname=shijima-qt-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r180.6a28b31
pkgrel=1
pkgdesc="Cross-platform shimeji simulation for desktop"
arch=('x86_64')
url="https://github.com/pixelomer/Shijima-Qt"
license=('GPL-3.0-only')
depends=(
	'qt6-base'
	'fuse2'
	'fuse-common'
	'qt6-multimedia'
)
makedepends=(
	'git'
	'pkgconfig' 
	'libarchive'
	'xcb-util-cursor'
) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+$url"
	"$_pkgname-icon.png::https://getshijima.app/shijima-icon.png"
)
sha256sums=('SKIP'
            'SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/$pkgname"

# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd "$srcdir/$pkgname"
	git submodule set-url libshijima https://github.com/pixelomer/libshijima
	git submodule set-url libshimejifinder https://github.com/pixelomer/libshimejifinder
	git submodule set-url cpp-httplib https://github.com/pixelomer/cpp-httplib
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$pkgname"
	CONFIG=release make -j8
}

#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	echo 
#}

package() {
	install -D "$_pkgname-icon.png" "$pkgdir/usr/share/icons/$_pkgname.png"

	cd "$srcdir/$pkgname"

	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/usr/share/applications/"
	
	install -Dm644 $_pkgname -t "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

	  install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop << EOF
[Desktop Entry]
Name=Shijima-Qt
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=meow
Categories=Game
EOF
}

