# Maintainer: Versus Void
pkgname=axtls
pkgver=1.5.4
pkgrel=1
pkgdesc="Highly configurable client/server TLSv1.2 library"
arch=(x86_64 i686)
url="http://axtls.sourceforge.net/"
license=('BSD')
groups=()
makedepends=()
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/axTLS-${pkgver}.tar.gz"
        "axtls-sni.patch"
        "config.h"
        ".config"
	   )
#noextract=()
sha256sums=("24d50cc4f5908d06cfacb2a3916d91ed75c5b1441809e47bc45e1053d6ba5d91"
			"28906cc3e4684f61791371d6de635618652bbc56e1b445ffcd397ffcc513ca8f"
			"8e32ee043b3e704e58e938eb1b28a495f3d0d2fbb241dfa2b0654e2c2f40ddb2"
			"17fcc8fe52357724a59c4bb2973274697bde3573160ac007306e788e3859e88f"
		   )

prepare() {
	cd "axtls-code"
	patch -p1 -i "$srcdir/axtls-sni.patch"
	cp "$srcdir/config.h" config/
	cp "$srcdir/.config" config/
	sed -i '/rm $(PREFIX)\/include\/axTLS\/os_port.h/d' Makefile
}

build() {
	cd "axtls-code"
	make
}

package() {
	cd "axtls-code"
	mkdir -p "$pkgdir/usr"
	sed "s#PREFIX=.*#PREFIX=\"$pkgdir/usr\"#g" -i config/.config
	make install
}
