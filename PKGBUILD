# Maintainer: Daniel Haß <aur@hass.onl>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Enlightenment Developers <enlightenment-devel@enlightenment.org>>

_pkgname=enlightenment
pkgname=$_pkgname-fresh
pkgver=0.20.6
pkgrel=1
pkgdesc="Enlightenment window manager - updated stable version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary-fresh' 'xcb-util-keysyms' 'hicolor-icon-theme' 'pixman' 'mesa'
         'desktop-file-utils' 'udisks2' 'ttf-font' 'bluez-libs')
makedeps=('make')
optdepends=('connman: network module'
            'acpid: power events on laptop lid close'
            'geoip-database: geolocation module')
provides=('notification-daemon' "$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/enlightenment/sysactions.conf'
        'etc/xdg/menus/e-applications.menu')
source=(http://download.enlightenment.org/rel/apps/${_pkgname}/$_pkgname-$pkgver.tar.xz)
install=enlightenment.install
sha256sums=('f21fbace15b8ea0e47c7aeb16a3f4d1e8a41cb85bc0035491091518b0ca55085')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-xwayland --enable-wayland \
    --disable-wl-weekeyboard

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -j1 DESTDIR="$pkgdir" install

  # install LICENSE
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}

