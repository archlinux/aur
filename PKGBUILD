# $Id$
# Maintainer: Kresimir Pripuzic <kpripuzic@gmail.com>

pkgname=gnome-settings-daemon-120dpi
pkgver=3.16.3
pkgrel=2
pkgdesc="The GNOME Settings daemon with an additional patch to change GNOME dpi settings from 96 to 120 dpi"
arch=(i686 x86_64)
license=(GPL)
depends=(dconf gnome-desktop gsettings-desktop-schemas hicolor-icon-theme libcanberra-pulse
         libnotify libsystemd libwacom pulseaudio pulseaudio-alsa upower librsvg libgweather
         geocode-glib geoclue2 nss libgudev)
makedepends=(intltool xf86-input-wacom libxslt docbook-xsl python2)
options=('!emptydirs')
install=gnome-settings-daemon.install
url="http://www.gnome.org"
groups=(gnome)
provides=('gnome-settings-daemon')
conflicts=('gnome-settings-daemon')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname:0:21}/${pkgver:0:4}/${pkgname:0:21}-$pkgver.tar.xz
        120dpi.patch)
sha256sums=('8752f79ba2ee76701744b4806140d1b88c665ad7cd44e7ff58b4e78e1063daea'
	    'ad32314bb0251298290f4f739be9fe278d498723856248ce4956044b17db4cfa')

build() {
  cd ${pkgname:0:21}-$pkgver

  patch -Np1 -i ../120dpi.patch

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
