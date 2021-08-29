# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>
# Contributor: Cosku Bas <cosku.bas@gmail.com>

pkgname=gtkradiant-git
pkgver=r1409.a1ae7779
pkgrel=1
pkgdesc="GtkRadiant is the official level design toolchain for games powered by id Tech engines."
arch=('i686' 'x86_64')
url="http://icculus.org/gtkradiant/"
license=('GPLv2')

makedepends=('git' 'svn' 'scons')
depends=('gtkglext' 'libgl' 'gtk2' 'libjpeg' 'libpng' 'zlib' 'libxml2')

source=(git://github.com/TTimo/GtkRadiant.git
        fix-gcc-11.patch
        gtkradiant.desktop
        gtkradiant.png)
sha1sums=('SKIP'
          '5b70010c2f58de2a6898ccf309948620db707758'
          '5a876097bcba753c22ea3b9771619ea737cccabf'
          '6ea35c575cc8036201ea62c51a77091ae51ba1d5')

pkgver() {
	cd GtkRadiant
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd GtkRadiant
	patch -p1 -i "$srcdir/fix-gcc-11.patch"
}

build() {
	cd GtkRadiant
	scons BUILD=release
}

package() {
	cd GtkRadiant
	mkdir -p $pkgdir/opt/gtkradiant
	cp -r install/* $pkgdir/opt/gtkradiant/.
	install -Dm644 "$srcdir/gtkradiant.desktop" "$pkgdir/usr/share/applications/gtkradiant.desktop"
	install -Dm644 "$srcdir/gtkradiant.png" "$pkgdir/usr/share/pixmaps/gtkradiant.png"
}
