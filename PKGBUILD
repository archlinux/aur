# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=fbgrab
pkgver=1.3
pkgrel=2
pkgdesc="A framebuffer screenshot grabber"
arch=(x86_64)
url="http://fbgrab.monells.se/"
license=("GPL")
depends=('libpng')
makedepends=('libpng')
source=("https://fbgrab.monells.se/fbgrab-$pkgver.tar.gz")
sha256sums=('5fab478cbf8731fbacefaa76236a8f8b38ccff920c53b3a8253bc35509fba8ed')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  # patch from Curtis McEnroe <programble@gmail.com> which should fix alpha
  patch -p1 fbgrab.c <<EOF
diff -wbBur fbgrab-1.3/fbgrab.c fbgrab-1.3.q/fbgrab.c
--- fbgrab-1.3/fbgrab.c	2015-06-16 23:53:20.000000000 +0300
+++ fbgrab-1.3.q/fbgrab.c	2017-05-03 19:49:22.310138775 +0300
@@ -279,7 +279,7 @@
 	/* RED   = 2 */
         outbuffer[(i<<2)+Red] = inbuffer[i*4+srcRed];
 	/* ALPHA */
-        outbuffer[(i<<2)+Alpha] = srcAlpha >= 0 ? inbuffer[i*4+srcAlpha] : 0xff;
+        outbuffer[(i<<2)+Alpha] = srcAlpha >= 0 ? inbuffer[i*4+srcAlpha] : '\0';
     }
 }
 
EOF
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make install DESTDIR="$pkgdir"
}