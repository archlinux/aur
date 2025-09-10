# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: claymorwan <claymorwan@fembois.dev>
pkgname=wallpaper-engine-linux-gui-git
_pkgname="$(echo $pkgname | sed 's/-git//g')"
pkgver=r83.ddb264f
pkgrel=1
pkgdesc="applies a wallpaper from wallpaper engine. "
arch=(any)
url="https://github.com/Poellebob/wallpaper-engine-linux-gui/"
license=('GPL-3.0')
depends=(linux-wallpaperengine-git python python-gobject gtk4 gobject-introspection gtk4 gdk-pixbuf2)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/$_pkgname"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	install -Dm755 "../$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
	cd "$srcdir/$_pkgname"

	_files=("main.py" "main.ui" "main.ui.cmb")
	for _file in ${_files[@]}; do
		install -Dm755 $_file "$pkgdir/opt/$_pkgname/$_file"
	done

	install -D LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -D icon.png "$pkgdir/usr/share/icons/$_pkgname.png"
	install -Dm0644 /dev/stdin $pkgdir/usr/share/applications/$_pkgname.desktop <<EOF
[Desktop Entry]
Name=wallpaper Engine Linux
Exec=/usr/bin/$_pkgname
Icon=$_pkgname
Terminal=false
Type=Application
Comment=GUI for linux-wallpaperengine
Categories=Utility
EOF
}
