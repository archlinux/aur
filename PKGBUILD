# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Alberto Casademunt <alberto.casademunt at protonmail dot ch>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com> (gnome-control-center PKGBUILD)
# Contributor: Jan de Groot <jgc@archlinux.org> (gnome-control-center PKGBUILD)
_pkgname='gnome-control-center'
pkgname="$_pkgname-nocheese"
pkgver='3.36.1'
_gvccommit='468022b708fc1a56154f3b0cc5af3b938fb3e9fb'
pkgrel='1'
pkgdesc="GNOME's main interface to configure various aspects of the desktop - without Cheese dependency"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.gnome.org/GNOME/$_pkgname"
license=('GPL2')
groups=('gnome')
depends=(
	'accountsservice' 'bolt' 'colord-gtk' 'cups-pk-helper' 'gnome-bluetooth'
	'gnome-color-manager' 'gnome-desktop' 'gnome-online-accounts'
	'gnome-settings-daemon' 'grilo' 'gsettings-desktop-schemas' 'gsound' 'gtk3'
	'libgnomekbd' 'libgtop' 'libgudev' 'libhandy' 'libibus' 'libmm-glib'
	'libpwquality' 'nm-connection-editor' 'smbclient' 'sound-theme-freedesktop'
	'udisks2' 'upower'
)
optdepends=(
	'gnome-user-share: Bluetooth and WebDAV file sharing'
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
sha256sums=('16a7a416b3ed98062a083b4e7189dc6f2e28964ca549dcea4a50529d01277ba7'
            '3ab63b0073bf21cab80b3974c9f6aa969ff1a4c4911aae6a09681c7d1b2b785f')

_sourcedirectory="$_pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	rm -rf 'subprojects/gvc/'
	mv "../libgnome-volume-control-$_gvccommit/" 'subprojects/gvc/'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	arch-meson "$srcdir/$_sourcedirectory/" build -D documentation=true -D cheese=false
	ninja -C build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	meson test -C build --print-errorlogs
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" meson install -C build
	install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
