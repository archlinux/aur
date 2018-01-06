# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Thomas Mudrunka <harvie@@email..cz>

pkgname=gpointing-device-settings
pkgver=1.5.1
pkgrel=5
pkgdesc="GUI tool for setting pointing device such as TrackPoint or Touchpad"
arch=('x86_64')
license=('GPL')
url="https://wiki.gnome.org/Attic/GPointingDeviceSettings"
depends=('gtk2' 'gconf')
makedepends=('gnome-settings-daemon' 'intltool')
source=("http://sourceforge.jp/frs/redir.php?m=iij&f=/gsynaptics/45812/$pkgname-$pkgver.tar.gz"
        "fix-build.patch")
md5sums=('1d1491473df8eabca3c15c997a975d7f'
         'cc42b7bcd69fb43ae5bfbe6e1d540713')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix build
  patch -Np1 -i "${srcdir}/fix-build.patch"

  # Disable GSD plugin (won't build with GSD 3.8)
  sed -i 's/ gnome-settings-daemon-plugins//' modules/Makefile.am
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fi
  ./configure  --prefix=/usr --sysconfdir=/etc \
               --disable-static --disable-schemas-install \
               --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  # Remove GConf schema (used by GSD plugin)
  rm -r "${pkgdir}/usr/share/gconf"
}
