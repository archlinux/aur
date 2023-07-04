# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

_pkgname=fsv
pkgname=fsv3
pkgver=3.0
pkgrel=2
pkgdesc="A 3D file system explorer (GTK3 port)"
arch=('x86_64')
url="https://github.com/jabl/fsv"
license=('LGPL2.1')
depends=(cglm gtk3 glu libepoxy gdk-pixbuf2 zlib glibc gettext glib2)
makedepends=(meson ninja)
provides=(fsv2)
conflicts=(fsv2)
replaces=(fsv2 fsv)
source=("$_pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/refs/tags/$_pkgname-$pkgver.tar.gz"
	disable_assertions.patch
	disable_ogl_abort.patch
	non-fatal-assertions.h)
b2sums=('44d6f202b50581b193e15c2a9252e6a2db6b579f0fd2716d48f5d1de256443a5fcb366e27d8f4f31dc7fabb0ffd71868908e5950a66c7b8bed3f87dc6a85c99b'
        '6d826eb41536fc95811c9ccf48d4f6dc1a65995992ac39bc9f9e48bb2bd088ce14a1db0fd44d74bb5148b6cb66b41948b5f2b4f0abeb99932cd2bf6dfb97c59f'
        '415071f6f8cf6afd01fd01fcf122474ae2ffbf35d2cf4bf40aabe8742c0ef711e320a7a1fda64e94c0891e5e9e38ee25c75b44e3f075fbe9447f8b0ea6598f0e'
        '710db356167d187b85e6ae71aa20c83fd5c83946130912bba6a691f0b4dbe3c82a69147346f868f4844b363a9728ca4c21e4fbc6ae638b64ebfa296c06e9b037')

function _check_debug() {
    . /etc/makepkg.conf
    for option in "${OPTIONS[@]}"; do
        if [[ $option == "debug" ]]; then
            echo "debugoptimized"
            return
        elif [[ $option == "!debug" ]]; then
            echo "release"
            return
        fi
    done
    echo "release"
    return
}

prepare() {
	cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
	patch -p1 src/common.h ../disable_assertions.patch 
	patch -p1 src/ogl.c ../disable_ogl_abort.patch 
	cp ../non-fatal-assertions.h src
	[ ! -f po/LINGUAS ] && touch po/LINGUAS || true
}

build() {
	cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
	RECONFIGURE=$([ -d builddir ] && cat <<< --reconfigure || true)
	export CFLAGS="$CFLAGS -Wno-maybe-uninitialized"
	meson setup $RECONFIGURE -Dbuildtype=`_check_debug` -Dc_args="$CFLAGS" -Ddefault_library=both -Dprefix=/usr builddir
	cd builddir
	ninja
}

package() {
	cd "$srcdir/$_pkgname-$_pkgname-$pkgver"
	cd builddir
	install -Dm755 src/fsv "$pkgdir/usr/bin/fsv"
	ln -s fsv "$pkgdir/usr/bin/fsv3"
	cd ..
	mkdir -p "$pkgdir/usr/share/doc/fsv3/"
	cp -v doc/* "$pkgdir/usr/share/doc/fsv3/"
	mkdir -p "$pkgdir/usr/share/licenses/fsv3/"
	cp -v LICENSE.md "$pkgdir/usr/share/licenses/fsv3/LICENSE"
	cp -v AUTHORS "$pkgdir/usr/share/licenses/fsv3/AUTHORS"
	cp -v TODO "$pkgdir/usr/share/doc/fsv3/"
	cp -v NOTES "$pkgdir/usr/share/doc/fsv3/"
	cp -v README.md "$pkgdir/usr/share/doc/fsv3/"
	mkdir -p "$pkgdir/usr/share/fsv3/"
	cp -v fsv.wmconfig "$pkgdir/usr/share/fsv3/"
}
