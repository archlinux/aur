# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>

shopt -s extglob

pkgname=wake
pkgver=0.19.2
pkgrel=1
pkgdesc="The SiFive wake build tool"
arch=('x86_64')
url="https://github.com/sifive/wake"
license=('custom')
depends=('dash' 'sqlite' 'gmp' 'fuse2' 'libutf8proc' 're2')
optdepends=('re2c: for flag support')
source=("https://github.com/sifive/wake/releases/download/v$pkgver/wake_$pkgver.tar.xz")
sha512sums=('89345b618343b8dfbdde2cb5d5b1afb01eee7e935e2be0ac22f2ed65348cf88a46627c51d48a6033a2da779f7223005170486c1a89d960f0cb936baa4e771eec')

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
