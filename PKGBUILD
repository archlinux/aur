# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>

shopt -s extglob

pkgname=wake
pkgver=0.19.1
pkgrel=3
pkgdesc="The SiFive wake build tool"
arch=('x86_64')
url="https://github.com/sifive/wake"
license=('custom')
depends=('dash' 'sqlite' 'gmp' 'fuse2' 'libutf8proc' 're2')
optdepends=('re2c: for flag support')
source=("https://github.com/sifive/wake/releases/download/v$pkgver/wake_$pkgver.tar.xz")
sha512sums=('36f719ca2cb4962598134d31061c4f4aa4682c949b2794640354690d863444240e3549f341150fa76ce0d427e3a8b51fb569c2f87ef3107121f4693aedee9d0e')

prepare() {
  cd $pkgname-$pkgver
  (cd utf8proc; rm !(utf8proc.wake))
  sed -i 's|utf8proc/utf8proc.c ||;s|CORE_LDFLAGS :=	\$|CORE_LDFLAGS :=	$(shell pkg-config --silence-errors --libs libutf8proc) $|' Makefile
  sed -i 's|"utf8proc"|"libutf8proc"|' utf8proc/utf8proc.wake
  sed -i "s^releaseCFlags = (\"-Wall\", \"-O2^releaseCFlags = (\"$(echo $CFLAGS | sed 's/ /", "/g')^" share/wake/lib/system/gcc.wake
  sed -i "s^releaseLFlags = (^releaseLFlags = (\"$(echo $LDFLAGS | sed 's/ /", "/g')\", ^" share/wake/lib/system/gcc.wake
}

build() {
  cd $pkgname-$pkgver
  make USE_FUSE_WAKE=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr" install
  mkdir -p "$pkgdir"/usr/share/licenses/wake
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE* "$pkgdir"/usr/share/licenses/wake

  rm -r "$pkgdir"/usr/build
}
