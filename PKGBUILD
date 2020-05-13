# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Contributer: Eric Belanger <eric@archlinux.org>
# Contributor: Jakub Kądziołka <kuba@kadziolka.net>

pkgname=xscreensaver-arch-logo-nogdm
pkgver=5.44
pkgrel=1
pkgdesc="Screen saver and locker for the X Window System with Arch Linux branding"
url="https://www.jwz.org/xscreensaver/"
arch=('x86_64')
license=('BSD')
depends=('libglade' 'libxmu' 'glu' 'xorg-appres' 'perl-libwww')
makedepends=('bc' 'intltool' 'libxpm')
conflicts=('xscreensaver')
provides=('xscreensaver')
backup=('etc/pam.d/xscreensaver')
source=(https://www.jwz.org/xscreensaver/${pkgname%%-*}-${pkgver}.tar.gz
LICENSE logo-50.xpm logo-180.xpm logo-50.png logo-180.png)
sha256sums=('73d8089cfc7d7363b5dac99b5b01dffb3429d0a855e6af16ce9a4b7777017b95'
            'c0247a0328f07656f6b7a5854f57fe735579f161b6f40df967cf9a5eab772d63'
            '82366926a2a81bd08459327936ba144e8b3ea5ee4a386c268bd898e1791ab1a0'
            '253f0d5bbdd841f21a7bbdbb0fd7ded21f711751d5cb1b7914952bdd6541b36d'
            '8027bdb2b4328d154a8e517bdb94f5ef4a9eb031e79a285dabedd62acfa77317'
            '8357f9e631b80ae373cb0fc8e27fa96fd032c3d5e3869bd04dde843b79260b19')

prepare() {
  cd "${pkgname%%-*}-${pkgver}"
  sed 's|-std=c89||' -i configure.in
  autoreconf -fiv
}

build() {
  cd "${pkgname%%-*}-${pkgver}"
  install -Dm644 "$srcdir"/logo-180.xpm  "${srcdir}"/${pkgname%%-*}-${pkgver}/utils/images/logo-180.xpm
    ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --with-x-app-defaults=/usr/share/X11/app-defaults \
    --with-pam \
    --without-login-manager \
    --with-gtk \
    --with-gl \
    --without-gle \
    --with-pixbuf \
    --with-jpeg
  make
}

package() {
  cd "${pkgname%%-*}-${pkgver}"
  install -d "${pkgdir}/etc/pam.d"
  make install_prefix="${pkgdir}" install
  install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%%-*}"
  chmod 755 "${pkgdir}/usr/bin/xscreensaver"
  echo "NotShowIn=KDE;GNOME;" >> "${pkgdir}/usr/share/applications/xscreensaver-properties.desktop"
}
