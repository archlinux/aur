# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>

shopt -s extglob

pkgname=wake
pkgver=0.20.0
pkgrel=1
pkgdesc="The SiFive wake build tool"
arch=('x86_64')
url="https://github.com/sifive/wake"
license=('custom')
depends=('dash' 'sqlite' 'gmp' 'fuse2' 'libutf8proc' 're2')
optdepends=('re2c: for flag support')
source=("https://github.com/sifive/wake/releases/download/v$pkgver/wake_$pkgver.tar.xz")
sha512sums=('d3c666f00e6ca1b660a48cd1e3ed50718c70671a0bdf1f5f19afd41fe281de97bcc3208ca6136489dddc4297c728bbd501dafb09bb432c0d7bb75c7a7754cc68')

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
