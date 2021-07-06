# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=orca-git
pkgver=40.0.r65.g989596c9b
pkgrel=1
pkgdesc="Screen reader for individuals who are blind or visually impaired (development version)"
url="https://wiki.gnome.org/Projects/Orca"
arch=(any)
license=(LGPL)
depends=(gtk3 at-spi2-atk python-atspi python-dbus python-pyxdg speech-dispatcher liblouis brltty
         xorg-xmodmap gsettings-desktop-schemas
         gst-plugins-base # playbin, audiotestsrc, basic decoders
         gst-plugins-good # pulsesink, more decoders
)
makedepends=(itstool intltool git yelp-tools)
groups=(gnome)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("${pkgname%-git}::git+https://gitlab.gnome.org/GNOME/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	# cutting off 'ORCA_' prefix that presents in the git tag
	git describe --long | sed 's/^ORCA_//;s/\([^-]*-g\)/r\1/;s/_/-/g;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "${srcdir}/${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR="${pkgdir}" install
}
