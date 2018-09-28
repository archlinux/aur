# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: joel <aullidolunar at gmai1 d0t c0m>
# Based on the splitted packkage: https://aur.archlinux.org/packages/pasystray-gtk2/

_pkgname=pasystray
pkgname=${_pkgname}-gtk3-git
pkgver=0.7.0.r0.g62a7029
pkgrel=1
pkgdesc="PulseAudio system tray (gtk3 version)"
arch=('x86_64')
url="https://github.com/christophgysin/pasystray"
license=('LGPL')
groups=('multimedia')
provides=(${_pkgname})
conflicts=(${_pkgname})
replace=(${_pkgname} ${_pkgname}-gtk3-standalone)
depends=('gtk3' 'libpulse' 'libnotify' 'avahi' 'libx11')
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
	sed -i -e '/<requires /d' -e '/license_type/d' src/pasystray.gtk3.glade
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
