# Maintainer: Robin Visser <rxvisser@gmail.com>
# Contributor: Filip Hendrik <stoatally@gmail.com>
# Contributor: Rowan Lewis <rl@nbsp.io>

rplname=gnome-settings-daemon
pkgname=gnome-settings-daemon-volume-step-patch
pkgver=3.24.2
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
sha256sums=('4aa9d72644e3ee8a30096a38986b0e9543fca92f586c561f6c8a11fb8148dcca'
            '754b89fbb2fd1da0f431e53b9aeaab511734234031c57c62d4747cfafeef2438')

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
