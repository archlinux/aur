# Maintainer: Master81 <FreeFighter81@protonmail.com>

pkgname=toosheh
pkgver=1.1.3
pkgrel=2
pkgdesc="An unofficial and open-source toosheh client for Linux written in C++. Please USE A VPN or any anti-sensorship tool before installing this program."
url="https://www.toosheh.org/"
arch=(x86_64 aarch64)
license=(GPL)
depends=(toosheh-extractor gtkmm3 coreutils grep)
makedepends=(gcc gtkmm3)
conflicts=(toosheh)
provides=(toosheh)
source=("https://gitlab.com/toosheh/toosheh-for-linux/-/archive/${pkgver}/toosheh-for-linux-${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
	cd $srcdir/toosheh-for-linux-${pkgver}/resource
	glib-compile-resources --target=resources.c --generate-source resources.xml
	cd ..
	g++ -rdynamic src/main.cpp resource/resources.c -o toosheh `pkg-config gtkmm-3.0 --libs --cflags`
}

package() {
	cd $srcdir/toosheh-for-linux-${pkgver}
	#install executable
   install -d $pkgdir/usr/bin
   install -Dm755 toosheh $pkgdir/usr/bin/toosheh
   #integrate shortcut...
   install -d $pkgdir/usr/share/applications
   install -Dm644 resource/desktop/toosheh.desktop $pkgdir/usr/share/applications/toosheh.desktop
   #integrate icons...
   install -d $pkgdir/usr/share/icons/hicolor/
   for res in 32 48 64 128 192 256; do
   	install -d $pkgdir/usr/share/icons/hicolor/${res}x${res}/apps
   	install -m644 resource/image/icons/${res}x${res}/toosheh.png $pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/toosheh.png
   done
}
