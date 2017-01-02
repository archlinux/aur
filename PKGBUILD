# Based on the splitted packkage: https://aur.archlinux.org/packages/pasystray-gtk2/
# Maintainer: joel <aullidolunar at gmai1 d0t c0m>

_pkgname=pasystray
pkgname=${_pkgname}-gtk3-standalone
pkgver=0.6.0.r13.gccb5b6e
pkgrel=1
pkgdesc="PulseAudio system tray (a replacement for padevchooser gtk3 standalone version)"
arch=('i686' 'x86_64')
url="https://github.com/christophgysin/pasystray"
license=('LGPL')
groups=('multimedia')
provides=(${_pkgname})
conflicts=(${_pkgname})
replace=(${_pkgname})
depends=('gtk3' 'libpulse' 'libnotify' 'avahi' 'libx11' 'gnome-icon-theme' 'gtk-update-icon-cache')
optdepends=(
    'pulseaudio: To control a local pulseaudio instance'
    'paman: Launch PulseAudio manager from tray icon'
    'pavucontrol: Launch PulseAudio mixer from tray icon'
    'pavumeter: Launch PulseAudio volume meter from tray icon'
    'paprefs: Launch PulseAudio preferences from tray icon'
)

source=(git+https://github.com/christophgysin/${_pkgname}.git)
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
	cd "$srcdir/${_pkgname}"
	autoreconf -is
	sed -i -e '/<requires /d' -e '/license_type/d' src/pasystray.glade
}

build () {
	cd "$srcdir/${_pkgname}"
	# Do you need appindicator in gtk3?
	./configure --prefix=/usr --with-gtk=3 --disable-appindicator
}

package () {
    cd "$srcdir/${_pkgname}"
    make DESTDIR="$pkgdir/" install
}
