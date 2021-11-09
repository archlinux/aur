# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Alberto Casademunt <alberto.casademunt at protonmail dot ch>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org> (gnome-control-center PKGBUILD)
# Contributor: Jan de Groot <jgc@archlinux.org> (gnome-control-center PKGBUILD)
_pkgname='gnome-control-center'
pkgname="$_pkgname-nocheese"
pkgver='41.1'
_gvccommit='7a621180b46421e356b33972e3446775a504139c'
pkgrel='1'
pkgdesc="GNOME's main interface to configure various aspects of the desktop - without Cheese dependency"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.gnome.org/GNOME/$_pkgname"
license=('GPL2')
groups=('gnome')
depends=(
	'accountsservice' 'bolt' 'colord-gtk' 'cups-pk-helper' 'gnome-bluetooth'
	'gnome-color-manager' 'gnome-desktop' 'gnome-online-accounts'
	'gnome-settings-daemon' 'gsettings-desktop-schemas' 'gsound' 'gtk3'
	'libgnomekbd' 'libgtop' 'libgudev' 'libhandy' 'libibus' 'libmm-glib'
	'libpwquality' 'nm-connection-editor' 'power-profiles-daemon' 'smbclient'
	'sound-theme-freedesktop' 'udisks2' 'upower'
)
optdepends=(
	'gnome-user-share: WebDAV file sharing'
	'gnome-remote-desktop: screen sharing'
	'openssh: remote login'
	'rygel: media sharing'
	'system-config-printer: Printer settings'
)
makedepends=('docbook-xsl' 'meson' 'modemmanager' 'python')
checkdepends=('python-dbusmock' 'python-gobject' 'xorg-server-xvfb')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-gvc.tar.gz::https://gitlab.gnome.org/GNOME/libgnome-volume-control/-/archive/$_gvccommit/libgnome-volume-control-$_gvccommit.tar.gz"
)
sha512sums=('81fbfd57b1777fa359ddda4c9e410501f8f6fec5c0a57d573b0a233fd551e24e5e52b8d2ab360ef1030b028643a095915a2416de30ee0d67b5687e5b97298d7a'
            '3b67988c20c0728458a1b74658d07cb1856d149c44a951f0fdeff03da792cd428ac85f1ff6434778c56602374a00f6a040fd215a8bc0d018b033066037a4750f')

_sourcedirectory="$_pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	rm -rf 'subprojects/gvc/'
	mv "../libgnome-volume-control-$_gvccommit/" 'subprojects/gvc/'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	arch-meson "$srcdir/$_sourcedirectory/" build -D documentation=true -D cheese=false
	meson compile -C build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	meson test -C build --print-errorlogs
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	meson install -C build --destdir "$pkgdir"
	install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
