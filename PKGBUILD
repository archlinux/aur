# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: jjacky

pkgname=kalu-kde
_pkgname=${pkgname%-kde}
pkgver=4.4.0
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news; supports autohide in KDE Plasma's panel"
arch=('i686' 'x86_64')
url='https://github.com/Thulinma/kalu'
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=6.0' 'pacman<6.1' 'curl' 'libnotify'
         'notification-daemon' 'statusnotifier')
makedepends=('perl' 'groff')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
        statusnotifier.patch)
install=kalu.install
sha256sums=('b5731a1e39b6f47d45ba363ae35cb29490b579ba528cb0809c1c89547b89edfd'
            '8352d4e97d78576c57cae840a1b51086fd43da1a2d743258ec76470996b8c156')
provides=(${_pkgname})
conflicts=(${_pkgname})

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -p0 -i "$srcdir/statusnotifier.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-status-notifier
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  chmod 750 "$pkgdir/usr/share/polkit-1/rules.d"
  chown 0:102 "$pkgdir/usr/share/polkit-1/rules.d"
}
