# Maintainer: Jiri Tyr <jiri.tyr@gmail.com>

_pkg='keyleds'

pkgname="$_pkg-git"
pkgver=r295.1713616
pkgrel=1
pkgdesc='Advanced RGB LED driver/controller for G410, G513, G610, G810, G910 and GPro'
arch=('i686' 'x86_64')
url='https://github.com/spectras/keyleds'
license=('GPL3')
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
backup=('etc/keyledsd.conf')
provides=("$_pkg")
conflicts=("$_pkg")
source=("git+https://github.com/spectras/$_pkg.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkg"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkg/build"
  cmake -DCMAKE_BUILD_TYPE=MinSizeRel -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR:PATH=lib ..
  make
  gzip -9 ../keyledsd/keyledsd.1 -c > keyledsd.1.gz
  gzip -9 ../keyledsctl/keyledsctl.1 -c > keyledsctl.1.gz
}

package() {
  cd "$_pkg/build"
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
