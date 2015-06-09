# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=indicator-datetime
pkgver=12.10.2
pkgrel=5
pkgdesc='A very, very simple clock'
arch=('i686' 'x86_64')
url='https://launchpad.net/indicator-datetime'
license=('GPL')
groups=('pantheon' 'pantheon-unstable')
depends=('evolution-data-server' 'geoclue' 'ido' 'libdbusmenu-gtk3'
         'libindicator-gtk3')
makedepends=('intltool' 'python2')
optdepends=('switchboard-plug-datetime-bzr: Date & Time settings')
options=('!emptydirs')
install='indicator-datetime.install'
source=("https://launchpad.net/indicator-datetime/${pkgver%.*}/${pkgver}/+download/indicator-datetime-${pkgver}.tar.gz"
        'datetime-switchboard.patch'
        'datetime-systemd.patch')
sha256sums=('b32f272d218e4d0fad53c90433913e4a84e1c60031cb95c4d92d0b59f50e19d4'
            '3a63d5e469b72f39d4e46630e92e365d8ffdb14bb454d7c0aadc687ac41277d3'
            'd7b507e2e3bbc41dcb775c422d95042bb12cfe8418431ab965843554627fbda0')

prepare() {
  cd indicator-datetime-${pkgver}

  sed -i 's/-Werror//' */Makefile.{am,in}
  sed -i '/libedataserverui-3.0/d' configure{,.ac}
  patch -Np1 -i ../datetime-switchboard.patch
  patch -Np1 -i ../datetime-systemd.patch
}

build() {
  cd indicator-datetime-${pkgver}

  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"

  autoreconf -fi
  ./configure \
    --prefix='/usr' \
    --libexecdir='/usr/lib/indicator-datetime' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --enable-systemd \
    --disable-schemas-compile \
    --disable-static
  make -C src timedated.h
  make
}

package() {
  cd indicator-datetime-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
