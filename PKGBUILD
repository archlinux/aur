rplname=gnome-settings-daemon
pkgname=gnome-settings-daemon-volume-step-patch
pkgver=3.16.2
pkgrel=1
pkgdesc="The GNOME Settings daemon with an additional patch to allow configuration of volume steps"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
	'dconf' 'gnome-desktop' 'gsettings-desktop-schemas' 'hicolor-icon-theme'
	'libcanberra-pulse' 'libnotify' 'libsystemd' 'libwacom' 'pulseaudio'
	'pulseaudio-alsa' 'upower' 'librsvg' 'libgweather' 'geocode-glib'
	'geoclue2' 'nss'
)
makedepends=(
	'intltool' 'xf86-input-wacom' 'libxslt' 'docbook-xsl'
)
provides=('gnome-settings-daemon')
conflicts=('gnome-settings-daemon')
options=('!emptydirs')
install=gnome-settings-daemon.install
url="http://www.gnome.org"
groups=('gnome')
source=(
	http://ftp.gnome.org/pub/gnome/sources/$rplname/${pkgver:0:4}/$rplname-$pkgver.tar.xz
	volume-step.patch
)
sha256sums=(
	'd8d536584ebb8fb1403050eb65e7ee3328eba14b123542369ff1917e727fa69a'
	'bb1ac714e05d6b7b2c3e8a03180a580f9d8e65356a3fd70c3e8f5ba1d15bbb03'
)

prepare() {
	cd $rplname-$pkgver

	# https://bugzilla.gnome.org/show_bug.cgi?id=650371#c42
	patch -p1 -i ../volume-step.patch
}

build() {
	cd $rplname-$pkgver

	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
			--libexecdir=/usr/lib/$rplname --disable-static

	# https://bugzilla.gnome.org/show_bug.cgi?id=656231
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	make
}

package() {
	cd $rplname-$pkgver
	make DESTDIR="$pkgdir" install
}
