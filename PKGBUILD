# Maintainer: Filip Hendrik <stoatally@gmail.com>

rplname=gnome-settings-daemon
pkgname=gnome-settings-daemon-volume-step-patch
pkgver=3.20.1
pkgrel=1
pkgdesc="The GNOME Settings daemon with an additional patch to allow configuration of volume steps"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
	'dconf' 'gnome-desktop' 'gsettings-desktop-schemas' 'libcanberra-pulse'
	'libgudev' 'libnotify' 'libsystemd' 'libwacom' 'pulseaudio' 'pulseaudio-alsa'
	'upower' 'librsvg' 'libgweather' 'geocode-glib' 'geoclue2' 'nss'
)
makedepends=(
	'intltool' 'xf86-input-wacom' 'libxslt' 'docbook-xsl' 'python2'
)
provides=('gnome-settings-daemon')
conflicts=('gnome-settings-daemon')
options=('!emptydirs')
install=gnome-settings-daemon.install
url="http://www.gnome.org"
groups=('gnome')
source=(
	https://download.gnome.org/sources/$rplname/${pkgver:0:4}/$rplname-$pkgver.tar.xz
	volume-step.patch
)
sha256sums=('e84a075d895ca3baeefb8508e0a901027b66f7d5a7ee8c966e31d301b38e78e7'
            'bb1ac714e05d6b7b2c3e8a03180a580f9d8e65356a3fd70c3e8f5ba1d15bbb03')

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
