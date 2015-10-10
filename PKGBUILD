# Maintainer: Sergi Ruiz <lovechii555 at yahoo dot es>>

pkgname=gnome-settings-daemon-backlight-toshiba
_pkgname=gnome-settings-daemon
pkgver=3.18.0
pkgrel=1
pkgdesc="The GNOME Settings daemon with compatibility for toshiba backlight"
arch=(i686 x86_64)
license=(GPL)
depends=(dconf gnome-desktop gsettings-desktop-schemas libcanberra-pulse
         libnotify libsystemd libwacom pulseaudio pulseaudio-alsa upower librsvg libgweather
         geocode-glib geoclue2 nss libgudev)
makedepends=(intltool xf86-input-wacom libxslt docbook-xsl python2)
options=('!emptydirs')
install=gnome-settings-daemon.install
url="http://www.gnome.org"
groups=(gnome)
provides=('gnome-settings-daemon')
conflicts=('gnome-settings-daemon')
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
	toshiba.patch)
sha256sums=('8d3ef9c18538831ed89122fee0bdaca68b0e482a18b3c4388c4e672aba1b3cd5'

SKIP)

build() {
  cd $_pkgname-$pkgver

  patch -Np1 -i ../../toshiba.patch


  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/$_pkgname --disable-static

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
