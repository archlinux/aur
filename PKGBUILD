# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: jjacky

pkgname=kalu-kde
pkgver=4.1.0
pkgrel=2
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news; supports autohide in KDE Plasma's panel"
arch=('i686' 'x86_64')
url="http://jjacky.com/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=5.0' 'pacman<5.1' 'curl' 'libnotify'
         'notification-daemon' 'statusnotifier')
makedepends=('perl' 'groff')
source=(http://jjacky.com/${pkgname%-kde}/${pkgname%-kde}-$pkgver.tar.gz
        statusnotifier.patch)
install=kalu.install
sha1sums=('dbcc37899302d402717653f11ff303c5dc73b86d'
          'd58712ff827df6bea9c5eb5a7e3d9034f3cac506')
provides=(${pkgname%-kde})
conflicts=(${pkgname%-kde})

prepare() {
  cd "${pkgname%-kde}-$pkgver"
  patch -p0 -i ../statusnotifier.patch
}

build() {
  cd "$srcdir/${pkgname%-kde}-$pkgver"
  ./configure --prefix=/usr --enable-status-notifier
  make
}

package() {
  cd "$srcdir/${pkgname%-kde}-$pkgver"
  make DESTDIR="$pkgdir/" install
  chmod 750 "$pkgdir/usr/share/polkit-1/rules.d"
  chown 0:102 "$pkgdir/usr/share/polkit-1/rules.d"
}
