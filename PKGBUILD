# Maintainer: Sergi Ruiz <lovechii555 at yahoo dot es>>

pkgname=gnome-settings-daemon-backlight-toshiba
_pkgname=gnome-settings-daemon
pkgver=3.16.2
pkgrel=1
pkgdesc="The GNOME Settings daemon with compatibility for toshiba backlight"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dconf' 'gnome-desktop' 'gsettings-desktop-schemas' 'hicolor-icon-theme' 'libcanberra-pulse' 'libnotify' 'libsystemd' 'libwacom' 'pulseaudio' 'pulseaudio-alsa' 'upower' 'librsvg' 'libgweather' 'geocode-glib' 'geoclue2' 'nss')
makedepends=('intltool' 'xf86-input-wacom' 'libxslt' 'docbook-xsl')
options=('!emptydirs')
install=gnome-settings-daemon.install
url="http://www.gnome.org"
groups=('gnome')
provides=('gnome-settings-daemon')
conflicts=('gnome-settings-daemon')
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
	toshiba.patch)
sha256sums=('d8d536584ebb8fb1403050eb65e7ee3328eba14b123542369ff1917e727fa69a'

SKIP)

build() {
  cd $_pkgname-$pkgver

  patch -Np1 -i ../../toshiba.patch


  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/_$pkgname --disable-static

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
