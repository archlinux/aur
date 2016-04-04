# Somewhat based on the pld-linux package:
# https://github.com/pld-linux/h323plus/

pkgname=h323plus
pkgver=1.26.5
pkgrel=1
pkgdesc="H.323Plus project (continuation of OpenH323)"
url="http://www.h323plus.org/"
arch=(i686 x86_64)
depends=(celt0.5.1 ffmpeg opal)
source=("http://www.h323plus.org/source/download/$pkgname-v${pkgver//./_}.tar.gz"
        "https://raw.githubusercontent.com/pld-linux/h323plus/master/h323plus-mak-paths.patch"
        "https://raw.githubusercontent.com/pld-linux/h323plus/master/h323plus-celt051.patch"
        "avcodec.patch")
sha256sums=('73a5d8bcdbed94a05e4f43a81ef5b41fa5443fe1986ff876d9bebb7656f8ec32'
            '0450c24a0c86e94f4d2eda6acd2192699ef539120557b9145a7a7556b784adec'
            'abfb2a628b5fc80cbdbe5477731db7960fd5fd0d1fc7518e0ef33f2b64d8bcee'
            '0dd479ec2b8b79b88df2ea6b02a109e7fdcec23e01745d0f2af6088aaa267f71')

prepare() {
  cd "$pkgname"
  patch -Np1 < "$srcdir/h323plus-mak-paths.patch"
  patch -Np1 < "$srcdir/h323plus-celt051.patch"

	cd plugins
  patch -Np2 < "$srcdir/avcodec.patch"
  autoconf
}

build() {
  export PTLIB_CONFIG="/usr/bin/ptlib-config"
  cd "$pkgname"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-h235{,-256} \
    --enable-h249 \
    --enable-h460{,9,17,18,19m,23,25,26,p,pre,com} \
    --enable-h461 \
    --enable-t120 \
    --enable-t140 \
    --enable-aec \
    ;
  make \
    OPENH323DIR="$PWD" \
    OH323_INCDIR="$PWD/include" \
    OH323_LIBDIR="$PWD/lib" \
    ;
  make -C plugins \
    OPENH323DIR="$PWD" \
    OH323_INCDIR="$PWD/include" \
    OH323_LIBDIR="$PWD/lib" \
    ;
}

package() {
  cd "$pkgname"
  make \
    DESTDIR="$pkgdir" \
    OH323_LIBDIR="$PWD/lib" \
    install \
    ;
  make -C plugins \
    DESTDIR="$pkgdir" \
    install \
    ;
}

# vim: ts=2:sw=2:et:nowrap
