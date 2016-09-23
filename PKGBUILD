# Maintainer: Versus Void
pkgname=axtls
pkgver=2.0.1
pkgrel=1
pkgdesc="Highly configurable client/server TLSv1.2 library"
arch=(x86_64 i686)
url="http://axtls.sourceforge.net/"
license=('BSD')
groups=()
makedepends=()
source=("https://sourceforge.net/projects/axtls/files/${pkgver}/${pkgname}-${pkgver}.tar.gz/download"
        "axtls-sni.patch"
        "config.h"
        ".config"
	   )
#noextract=()
sha256sums=("6065adf95cf2d47fece86a91a48dfbdfeaa48e5ead9a1812231ecb1dcc8a2216"
			"374fbc949782ad7854268924f0ed9069bc2ca712ab1f428be0c5eb657b1701d2"
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
