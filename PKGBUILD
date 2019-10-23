# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: jjacky

pkgname=kalu-kde
pkgver=4.3.0
pkgrel=2
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news; supports autohide in KDE Plasma's panel"
arch=('i686' 'x86_64')
url="https://jjacky.com/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=5.2' 'pacman<5.3' 'curl' 'libnotify'
         'notification-daemon' 'statusnotifier')
makedepends=('perl' 'groff')
source=(http://jjacky.com/${pkgname%-kde}/${pkgname%-kde}-$pkgver.tar.xz
        statusnotifier.patch
        https://github.com/deraffe/kalu/commit/a46975cdcb926ea8508c012d333471c1e1cb8529.patch)
install=kalu.install
sha1sums=('4e9fc8b311077d3720af8619de04c917c01acbfb'
          'd58712ff827df6bea9c5eb5a7e3d9034f3cac506'
          '6418c6df072de666873e37240bddb33712ae4aac')
provides=(${pkgname%-kde})
conflicts=(${pkgname%-kde})

prepare() {
  cd "${pkgname%-kde}-$pkgver"
  patch -p0 -i "$srcdir/statusnotifier.patch"
  patch -p1 -i "$srcdir/a46975cdcb926ea8508c012d333471c1e1cb8529.patch"
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
