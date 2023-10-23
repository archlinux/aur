# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>

shopt -s extglob

pkgname=wake
pkgver=0.21.0
pkgrel=4
pkgdesc="The SiFive wake build tool"
arch=('x86_64')
url="https://github.com/sifive/wake"
license=('custom')
depends=('dash' 'sqlite' 'gmp' 'fuse2' 'libutf8proc' 're2')
makedepends=('clang')
optdepends=('re2c: for flag support')
source=("https://github.com/sifive/wake/releases/download/v$pkgver/wake_$pkgver.tar.xz"
        fixes-for-new-re2-with-abseil.patch)
sha512sums=('5d49d680796a2682037ad311b0495f2f04a69dc90faba4458a1bb84a3d5c42e9014563e4b6a3e9600d50a2d4c3cbf5e60318266535c73453c08085015bd57f68'
            'd8bdc9c45f874ef4a9628d259e25a185fdc5b26df6ee8d79940efe0c692d5fa24a9a0d1ae2d9d16792dc135ec8cf01c92c354b90f7c56301f48c5ffc05dacdc0')

prepare() {
  cd $pkgname-$pkgver
  (cd utf8proc; rm !(utf8proc.wake))
  sed -i 's|utf8proc/utf8proc.c ||;s|CORE_LDFLAGS :=	\$|CORE_LDFLAGS :=	$(shell pkg-config --silence-errors --libs libutf8proc) $|' Makefile
  sed -i 's|"utf8proc"|"libutf8proc"|' utf8proc/utf8proc.wake
  sed -i "s^releaseCFlags = (\"-Wall\", \"-O2^releaseCFlags = (\"$(echo $CFLAGS | sed 's/ /", "/g')^" share/wake/lib/gcc_wake/gcc.wake
  sed -i "s^releaseLFlags = (^releaseLFlags = (\"$(echo $LDFLAGS | sed 's/ /", "/g')\", ^" share/wake/lib/gcc_wake/gcc.wake

  # Build with clang to work around https://github.com/sifive/wake/issues/890
  sed -i -e '/^CC\t/s/cc/clang/' -e '/^CXX\t/s/c++/clang++/' Makefile

  # Build with newer C++ standard; needed for re2->abseil-cpp
  sed -i 's/-std=c++11/-std=c++17/' Makefile share/wake/lib/gcc_wake/gcc.wake
  patch -Np1 -i ../fixes-for-new-re2-with-abseil.patch
}

build() {
  cd $pkgname-$pkgver
  make USE_FUSE_WAKE=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/usr" install
  mkdir -p "$pkgdir"/usr/share/licenses/wake
  install -Dm644 LICENSE* -t "$pkgdir"/usr/share/licenses/wake/
}
