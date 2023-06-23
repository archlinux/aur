# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=orca-git
pkgver=44.0.r93.gcc26a1f6b
pkgrel=1
pkgdesc="Screen reader for individuals who are blind or visually impaired (development version)"
url="https://wiki.gnome.org/Projects/Orca"
arch=('any')
license=('LGPL')
depends=(
  at-spi2-core
  brltty
  gsettings-desktop-schemas
  gst-plugins-base # playbin, audiotestsrc, basic decoders
  gst-plugins-good # pulsesink, more decoders
  gtk3
  liblouis
  libwnck3
  python-atspi
  python-setproctitle
  speech-dispatcher
  xorg-xkbcomp
  xorg-xmodmap
)
makedepends=(
  git
  itstool
  yelp-tools
)
groups=('gnome')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://gitlab.gnome.org/GNOME/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	# cutting off 'ORCA_' prefix that presents in the git tag
	git describe --long | sed 's/^ORCA_//;s/\([^-]*-g\)/r\1/;s/_/-/g;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "${pkgname%-git}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="${pkgdir}" install
}
