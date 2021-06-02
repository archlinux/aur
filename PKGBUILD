# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>

shopt -s extglob

pkgname=wake
pkgver=0.20.1
pkgrel=1
pkgdesc="The SiFive wake build tool"
arch=('x86_64')
url="https://github.com/sifive/wake"
license=('custom')
depends=('dash' 'sqlite' 'gmp' 'fuse2' 'libutf8proc' 're2')
optdepends=('re2c: for flag support')
source=("https://github.com/sifive/wake/releases/download/v$pkgver/wake_$pkgver.tar.xz")
sha512sums=('2b1a7f524c312ad98c77e55d01a39718d04f698d6a24a381f2de376a06cc52dcdb01f0048847862727303793f85f7c9c1aa5dd04a8f715c82e73eea2cbe38ef7')

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
