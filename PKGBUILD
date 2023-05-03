#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
pkgbase=neptune
pkgname=("platinum-upnp" "platinum-upnp-docs" "neptune")
pkgver=1.3.0
pkgrel=2
pkgdesc="Platinum UPnP SDK + Neptune C++ Runtime by Axiomatic Software"
arch=("x86_64")
url="https://www.plutinosoft.com/platinum-slider/"
makedepends=(scons gcc git)
depends=(zlib)
provides=(libNeptune.a libPlatinum.a)
license=('GPL2')
_gituser=plutinosoft
_gitrepo=Platinum
source=("git+https://github.com/$_gituser/$_gitrepo#tag=$pkgver")
md5sums=("SKIP")

prepare() {
	cd "$_gitrepo"
	git submodule init
	git submodule update
}

build() {
	cd "$_gitrepo"
	scons target=x86_64-unknown-linux build_config=Release shared=true
}

package_platinum-upnp() {
	pkgdesc="Library / tools for building a UPnP mediaserver. Used behind the scenes by Plex, etc."
        depends+=(neptune)
	provides=(libPlatinum.a)
        cd "$_gitrepo"
        mkdir -p "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/lib"
        LIBS=$(find "$srcdir/$_gitrepo/Build/Targets/$arch-unknown-linux/Release/" -type f \( -name '*.a' -and -not -name 'libNeptune.a' \))
        for lib in $LIBS; do
                cp "$lib" "$pkgdir/usr/lib/"
        done
        find "$srcdir/$_gitrepo/Build/Targets/$arch-unknown-linux/Release/" -type f -executable -exec cp {} "$pkgdir/usr/bin/$pkgname" \;
	mkdir -p "$pkgdir/usr/include/platinum"
	cp "$srcdir/Platinum/Source/Core/"*.h "$pkgdir/usr/include/platinum"
	rm "$pkgdir/usr/lib/libZlib.a"
}

package_platinum-upnp-docs() {
        depends+=(platinum-upnp)
	provides=()
	pkgdesc="$pkgdesc (documentation)"
	cd "$_gitrepo"
	DOCDIR="$pkgdir/usr/share/doc/platinum-upnp"
	mkdir -p "$DOCDIR"
	cp -r "$srcdir/$_gitrepo/Docs/Doxygen/html/"* "$DOCDIR/"
}

package_neptune() {
	cd "$_gitrepo"
	pkgdesc="Neptune C++ runtime (static library)"
	provides=(libNeptune.a)
	license=("BSD")
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/include/platinum"
	cp "$srcdir/$_gitrepo/Build/Targets/$arch-unknown-linux/Release/libNeptune.a" "$pkgdir/usr/lib/"
	cp "$srcdir/Platinum/ThirdParty/Neptune/Source/Core/"*.h "$pkgdir/usr/include/platinum"
	ln -s "$pkgdir/usr/include/platinum" "$pkgdir/usr/include/neptune"
}
