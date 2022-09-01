# Maintainer: Triss Healy (trissylegs) <th at trissyle dot gs>

_pkgname=libshumate
pkgname=${_pkgname}-git
pkgver=1.0.0.beta.r1.g32f8d1a
pkgrel=2
pkgdesc="GTK4 widget to display maps (git version)"
arch=(x86_64 aarch64)
url="https://wiki.gnome.org/Projects/libshumate"
license=(LGPL)
depends=(gtk4 libsoup sqlite protobuf-c)
makedepends=(git gobject-introspection gtk-doc gi-docgen meson vala)
checkdepends=(xorg-server-xvfb)
provides=(libshumate)

source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

# Use version once repo has been tagged. But use revision numbers for now.
pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${_pkgname} build -D gtk_doc=true
  ninja -C build
}

check() {
  # Make a Empty $XDG_CONFIG_DIR to prevent issues to user
  # customization breaking tests
  mkdir -p $srcdir/test_config_dir
  
  # Run tests with headless x11 server.
  env \
    XDG_CONFIG_DIR=$srcdir/test_config_dir \
    XDG_CONFIG_HOME=$srcdir/test_config_dir \
    xvfb-run meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
