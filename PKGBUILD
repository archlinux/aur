# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=orca-git
pkgver=46.ALPHA.r159.g1c496c9ad
pkgrel=1
pkgdesc="Screen reader for individuals who are blind or visually impaired (development version)"
url="https://wiki.gnome.org/Projects/Orca"
arch=('any')
license=('LGPL-2.1-or-later')
depends=(
  at-spi2-core
  brltty
  gsettings-desktop-schemas
  gst-plugins-base # playbin, audiotestsrc, basic decoders
  gst-plugins-good # pulsesink, more decoders
  gtk3
  liblouis
  libwnck3
  python-gobject
  python-setproctitle
  python-psutil
  python-cairo
  speech-dispatcher
  xorg-xkbcomp
  xorg-xmodmap
)
makedepends=(
  git
  itstool
  yelp-tools
  meson
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

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
