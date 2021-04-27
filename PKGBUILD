# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-screensaver
pkgver=3.6.1
pkgrel=17
pkgdesc="Legacy GNOME screensaver"
arch=('x86_64')
license=('GPL')
url="https://wiki.gnome.org/Projects/GnomeScreensaver"
backup=(etc/pam.d/gnome-screensaver)
depends=('dbus-glib' 'libgnomekbd' 'gnome-desktop')
makedepends=('intltool' 'gnome-common')
optdepends=('gnome-backgrounds: default background')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz
       gnome-screensaver.pam
       move-desktop-file.patch
       fix-autoconf.patch
       fix-systemd-support.patch
       lock_screen_on_suspend.patch
       lightdm_switch_user.patch
       use-screensaver-background.patch
       recenter.patch
       gnome-desktop-3.36.patch)
sha256sums=('f39b78d4f7fed748c7f0a31d694112fb907c6d3c4e63db22eb858df07e962cd0'
            'b6ea9e2eb586d94bcabb617a8f1c2958111df87afdbb51f645882bccdc15cbda'
            '4bb96f62aa069c83b629204a79a3f63b146bcaf773569aee8b5dd23fbcd88974'
            'c4da9c18b543ecbc781c1f103321b324a855bdd0979fd36b437f6033736ad4bb'
            '8aa387578c1756e573f6558a66be25fc96d7e8567fb7bee580159479841f5f45'
            '516c479558576c6c5a2509abfcbf4fdafb5953d252e7a4ab972f9db6137daca8'
            '5d40bd6e1843150912dc52932eaa94c0f6d57931fd45a3769ef40e2335fe3c6f'
            '7161ff962801d9e34ea564c372de4b5f93b30180b83c13aadbc9a8a1cd73ff65'
            '6c428b9296376e4b5e2aaf503a754a1ba58333aab50c82279b7c5615d8dd9e69'
            '412acd14cf665c43a6e2831ed9941fc034174b8beb454210bca8b6068e1239c3')

prepare() {
  cd $pkgname-$pkgver

  # Upstream patch that moves gnome-screensaver desktop file out of autostart
  patch -Np1 -i ../move-desktop-file.patch

  # Fix build
  patch -Np1 -i ../fix-autoconf.patch

  # Fix systemd support
  patch -Np1 -i ../fix-systemd-support.patch

  # Lock screen on suspend with systemd
  patch -Np1 -i ../lock_screen_on_suspend.patch

  # Add support for user switch with LightDM
  patch -Np1 -i ../lightdm_switch_user.patch

  # Honour background setting of the lock screen
  patch -Np1 -i ../use-screensaver-background.patch

  # Restore the original position after shake
  patch -Np1 -i ../recenter.patch

  # Fix built with gnome-desktop 3.36
  patch -Np1 -i ../gnome-desktop-3.36.patch

  # Fix build with systemd support
  sed -i 's/libsystemd-login libsystemd-daemon/libsystemd/' configure.ac

  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  CFLAGS+=" -Wno-error=return-type"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --with-mit-ext --without-console-kit --with-systemd
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 ../gnome-screensaver.pam "$pkgdir/etc/pam.d/gnome-screensaver"
}
