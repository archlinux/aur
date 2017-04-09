# Maintainer: Adriaan Zonnenberg <amz@adriaan.xyz>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gnome-settings-daemon-redshift
pkgver=3.22.2
_pkgname=gnome-settings-daemon
pkgrel=2
pkgdesc="GNOME Settings Daemon with a patch to support changing the color temerature"
url="https://git.gnome.org/browse/gnome-settings-daemon"
arch=(i686 x86_64)
license=(GPL)
depends=(dconf 'gnome-desktop<1:3.24' gsettings-desktop-schemas libcanberra-pulse libnotify libsystemd
         libwacom pulseaudio pulseaudio-alsa upower librsvg libgweather geocode-glib geoclue2 nss
         libgudev gtk3-print-backends libnm)
makedepends=(intltool xf86-input-wacom libxslt docbook-xsl python git gnome-common)
provides=(gnome-settings-daemon)
conflicts=(gnome-settings-daemon)
groups=(gnome)
_commit=239ccb035d17380d801d9cdde3a10dce5b64ac85  # tags/GNOME_SETTINGS_DAEMON_3_22_2^0
source=("git+https://git.gnome.org/browse/gnome-settings-daemon#commit=$_commit"
        "git+https://git.gnome.org/browse/libgnome-volume-control"
        "https://raw.githubusercontent.com/benzea/gnome-shell-extension-redshift/master/patches/gsd-3.22-color-Add-ability-to-change-the-color-temperature-of.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^GNOME_SETTINGS_DAEMON_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git config --local submodule."panels/media-keys/gvc".url "$srcdir/libgnome-volume-control"
  git submodule update

  git apply ../gsd-3.22-color-Add-ability-to-change-the-color-temperature-of.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/$_pkgname --disable-static

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
