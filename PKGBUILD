# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>
# Contributor: Cosku Bas <cosku.bas@gmail.com>

pkgname=gtkradiant-git
pkgver=r1464.270af88f
pkgrel=1
pkgdesc="GtkRadiant is the official level design toolchain for games powered by id Tech engines."
arch=('i686' 'x86_64')
url="http://icculus.org/gtkradiant/"
license=('GPLv2')

makedepends=('git' 'svn' 'scons')
depends=('gtkglext' 'libgl' 'gtk2' 'libjpeg' 'libpng' 'zlib' 'libxml2')

source=(git+https://github.com/TTimo/GtkRadiant.git
	fix-build.patch
	gtkradiant.desktop
	gtkradiant.png)
sha256sums=('SKIP'
	    'e949ba5e31a31269096d37d89c90d4108a33dc259047dcad729f7f8bc1afd179'
	    'ef9f62afdb693a62976cdf5feb5fa2c9ccb1db23f781e3a5d47e196bed56a930'
	    '76d137d3bd04e2edb1eb20e4e8a63782f642130f5bd02f0ca47337e7dee636cb')

pkgver() {
	cd GtkRadiant
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd GtkRadiant
	patch -p1 -i "$srcdir/fix-build.patch"
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
