# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=gnome-phone-manager
pkgver=0.69
pkgrel=16
pkgdesc='Control your mobile phone from your GNOME desktop'
arch=('x86_64')
url='https://wiki.gnome.org/Attic/PhoneManager'
license=('GPL')
depends=('evolution-data-server' 'gnokii' 'gnome-bluetooth' 'libcanberra' 'telepathy-glib')
makedepends=('intltool' 'gnome-common' 'python')
source=("https://download.gnome.org/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"
        'gnome-phone-manager-0.68-eds.patch'
        '0001-Port-to-GSettings.patch')
sha256sums=('35e038ea3afaacdf451046e87af876096cf1520efc04fc3f5b63ea22e0297175'
            '232a72108836ddd46d329993d166c38550e2923f161b4dc814d75af4ed5ccc79'
            '7b0e07af7c534bd888609b2af0c02a913c7bb25d45039cab05e00b9eeb2d22ba')

prepare() {
  cd $pkgname-$pkgver

  # Port to evolution-data-server 3.8
  patch -p1 -i ../gnome-phone-manager-0.68-eds.patch

  # Port to GSettings
  sed -i 's/ libedataserverui-3.0//' ../0001-Port-to-GSettings.patch
  patch -Np1 -i ../0001-Port-to-GSettings.patch

  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-schemas-compile --disable-bluetooth-plugin --enable-compile-warnings=minimum
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
