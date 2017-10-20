# $Id$
# Maintainer: Sébastien Faucheux <faucheux.seb@gmail.com>

pkgname=gnome-settings-daemon-shutdown
pkgver=3.26.1
pkgrel=1
pkgdesc="The GNOME Settings daemon with shutdown button action"
arch=(i686 x86_64)
license=(GPL)
depends=(dconf gnome-desktop gsettings-desktop-schemas libcanberra-pulse libnotify libsystemd
         libwacom pulseaudio pulseaudio-alsa upower librsvg libgweather geocode-glib geoclue2 nss
         libgudev gtk3-print-backends libnm)
makedepends=(intltool xf86-input-wacom libxslt docbook-xsl python git gnome-common)
options=('!emptydirs')
install=gnome-settings-daemon.install
url="http://www.gnome.org"
groups=(gnome)
provides=('gnome-settings-daemon')
conflicts=('gnome-settings-daemon')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname:0:21}/${pkgver:0:4}/${pkgname:0:21}-$pkgver.tar.xz
        shutdown.patch)
sha256sums=('711ac9bad06f6a4225f5eb2f4796474662f81f7077e16a4b7ee7ab974b65d893'
            'cd2136653c24f85865b9011fdc3620448b771d9c50a7e7e16191c352ff02feda')

prepare() {
  cd ${pkgname:0:21}-$pkgver
  patch -Np1 -i ../shutdown.patch
}

build() {
  cd ${pkgname:0:21}-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/${pkgname:0:21} --disable-static

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname:0:21}-$pkgver
  make DESTDIR="$pkgdir" install
}
