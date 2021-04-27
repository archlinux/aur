# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=budgie-screensaver
pkgver=4.0
pkgrel=1
pkgdesc='Screensaver for the Budgie Desktop'
arch=('x86_64')
license=('GPL')
url='https://github.com/getsolus/budgie-screensaver'
backup=('etc/pam.d/budgie-screensaver')
depends=('dbus-glib' 'libgnomekbd' 'gnome-desktop')
makedepends=('intltool')
source=("https://github.com/getsolus/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver.tar.xz"
        'no-check.patch'
        'budgie-screensaver.pam')
sha256sums=('dde83f355e549b5f6290655f33acd910d2febbb8fd974f922b14814054f80f49'
            '8f429830eb02ae91ddb3dcfb7a04d6da135e8f45caff6e0124713b0e064de7bb'
            'b6ea9e2eb586d94bcabb617a8f1c2958111df87afdbb51f645882bccdc15cbda')

prepare() {
  cd $pkgname-v$pkgver
  # Remove unneeded DE check
  patch -Np1 -i ../no-check.patch
}

build() {
  cd $pkgname-v$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/$pkgname \
              --with-mit-ext --without-console-kit --with-systemd
  make
}

package() {
  cd $pkgname-v$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../budgie-screensaver.pam "$pkgdir/etc/pam.d/budgie-screensaver"
}
