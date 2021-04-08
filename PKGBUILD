# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Zeph <zeph33@gmail.com>
# Based on the PKGBUILD created by Zeph <zeph33@gmail.com>

pkgname=('pamac-aur-git')
_pkgname=pamac
pkgver=10.1.0beta2.r0.gee994af
_pkgver=10.1.0
pkgrel=2
pkgdesc="A Gtk3 frontend for libalpm - git version"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('dbus-glib' 'vte3>=0.38' 'libnotify' 'pacman>=5.2' 'pacman<5.3' 'appstream-glib' 'libappindicator-gtk3' 'archlinux-appstream-data-pamac' 'git' 'libhandy')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc')
options=(!emptydirs)
# Only for Manjaro users who should not use it...
provides=('pamac')
conflicts=('pamac')
# End of Manjaro users section
source=(git+https://gitlab.manjaro.org/applications/$_pkgname.git
	gnome-40.patch)
sha256sums=('SKIP'
            '7246c8a0424c08870acb448c57d0a90ca5f675dc8e15e118ee8c13930ba584e1')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

prepare() {
  # adjust version string
  cd $_pkgname
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/manager_window.vala
  # patches here
  patch -np1 -i ../gnome-40.patch
}

build() {
  cd $_pkgname
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc -Denable-appindicator=true --buildtype=release
  # build
  ninja
}

package() {
  backup=('etc/pamac.conf')
  conflicts=('pamac-aur')
  install=pamac.install
  cd $_pkgname
  cd builddir
  DESTDIR="$pkgdir" ninja install
  # removed pamac-mirrorlist-timer, useless for Archlinux
  # remove pamac-tray-appindicator
}

#vim:set ts=2 sw=2 et:
