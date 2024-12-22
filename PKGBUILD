# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='keyleds'
pkgver='1.1.1'
pkgrel='3'
pkgdesc='Advanced RGB LED animation driver for G213, G410, G513, G610, G810, G910 and GPro'
arch=('i686' 'x86_64')
url="https://github.com/spectras/keyleds"
license=('GPL3')
groups=()
depends=(
  'libuv'
  'libx11'
  'libxi'
  'libxml2'
  'libyaml'
  'luajit'
  'systemd'
)
makedepends=(
  'cmake>=3.0'
)
optdepends=()
backup=('etc/keyledsd.conf')
options=()
install=
source=(
  "https://github.com/spectras/keyleds/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  'pr74.patch'
)
sha256sums=(
  '619997d1f3401153370013693cbfa3d7a41edecb9c5654fe99d017b686ada69a'
  'a0edb3496655cce4a7e839af8a869e4c03ce5f3917e894df5b684b2a0ee111ad'
)

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../pr74.patch
}

build() {
  cd "$pkgname-$pkgver/build"
  cmake -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR:PATH=lib ..
  make
  gzip -9 ../keyledsd/keyledsd.1 -c > keyledsd.1.gz
  gzip -9 ../keyledsctl/keyledsctl.1 -c > keyledsctl.1.gz
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  cd ..
  install -m 644 -D keyledsd/keyledsd.conf.sample "$pkgdir/etc/keyledsd.conf"
  install -d "$pkgdir/etc/xdg/autostart"
  ln -s /usr/share/keyledsd/keyledsd.desktop "$pkgdir/etc/xdg/autostart/"
  install -m 644 -D logitech.rules "$pkgdir/usr/share/keyledsd/logitech.rules"
  install -d "$pkgdir/usr/lib/udev/rules.d/"
  ln -s /usr/share/keyledsd/logitech.rules "$pkgdir/usr/lib/udev/rules.d/70-logitech-hidpp.rules"
  install -m 644 -D build/keyledsd.1.gz "$pkgdir/usr/share/man/man1/keyledsd.1"
  install -m 644 -D build/keyledsctl.1.gz "$pkgdir/usr/share/man/man1/keyledsctl.1"
}
