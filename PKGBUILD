# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=orca-git
pkgver=51.1.r122.gb2bdec9ea
pkgrel=2
pkgdesc="Screen reader for individuals who are blind or visually impaired (development version)"
url="https://wiki.gnome.org/Projects/Orca"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=(
  at-spi2-core
  dconf
  glib2
  glibc
  gobject-introspection-runtime
  gsettings-desktop-schemas
  gst-plugins-base # playbin, audiotestsrc, basic decoders
  gst-plugins-good # pulsesink, more decoders
  gstreamer
  gtk3
  hicolor-icon-theme
  libgcc
  liblouis
  libwnck3
  pango
  python
  python-brltty
  python-cairo
  python-dasbus
  python-dbus
  python-gobject
  python-psutil
  python-setproctitle
  speech-dispatcher
  xorg-xkbcomp
  xorg-xmodmap
)
checkdepends=(
  python-pytest
  python-pytest-mock
  xorg-server-xvfb
)
makedepends=(
  cargo
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

# Keep debug info in Cargo output for makepkg's symbol handling.
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

# Use link-time optimization across the MathCAT build.
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

pkgver() {
	cd "${pkgname%-git}"
	# cutting off 'ORCA_' prefix that presents in the git tag
	git describe --long | sed 's/^ORCA_//;s/\([^-]*-g\)/r\1/;s/_/-/g;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target host-tuple \
    --manifest-path subprojects/mathcat-py/Cargo.toml
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
