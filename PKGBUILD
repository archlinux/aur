pkgname=gnome-desktop-git
_pkgname=gnome-desktop
pkgver=40.0+17+gbab26981
pkgrel=1
epoch=1
pkgdesc="Library with common API for various GNOME modules"
url="https://gitlab.gnome.org/GNOME/gnome-desktop"
arch=(x86_64)
license=(GPL LGPL)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gsettings-desktop-schemas'
         'gtk3'
         'xkeyboard-config'
         'iso-codes'
         'libseccomp'
         'bubblewrap'
         'systemd-libs'
         'libxkbcommon')
makedepends=('gobject-introspection'
             'git'
             'meson'
             'gtk-doc'
             'yelp-tools')
checkdepends=(xorg-server-xvfb)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/-/+/g'
}

build() {
    arch-meson ${_pkgname} build \
    -D gnome_distributor="Arch Linux" \
    -D gtk_doc=true \
    -D debug_tools=false \
    -D date_in_gnome_version=false
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
