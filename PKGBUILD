# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
# https://gitlab.manjaro.org/packages/extra/pamac
pkgname=pamac-cli
pkgver=9.1.1
pkgrel=1
_pkgfixver=$pkgver

_pkgvercommit=v$pkgver
#_pkgvercommit='cd8551cdd40aef492589589c8c3b7fcadf0eaa42'
sha256sums=('d33cdb4095d8182d8e1f23fa4ab8ba64b8e67f40e4766b53dedfc8a5289f30b7'
            '3d181e4bc9a33867b51e2b673440a4f29605508b7f53a10772097f1c28a71881')

pkgdesc="Pamac cli frontend for libalpm"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'pacman>=5.2' 'appstream-glib' 'archlinux-appstream-data')
optdepends=('')
makedepends=('gettext' 'itstool' 'vala>=0.36.6' 'meson' 'ninja' 'git' 'gobject-introspection')
conflicts=('pamac' 'pamac-aur' 'pamac-aur-git')
provides=('pamac')
replaces=('pamac')
options=(!emptydirs)
install=

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_pkgvercommit/pamac-$_pkgvercommit.tar.gz" "meson.build")

prepare() {
  cd "$srcdir/pamac-$_pkgvercommit"

  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cp -f "$srcdir/meson.build" "$srcdir/pamac-$_pkgvercommit/src/meson.build"
  cd "$srcdir/pamac-$_pkgvercommit"
  mkdir -p builddir
  cd builddir
  meson --buildtype=release --prefix=/usr --sysconfdir=/etc

  # build
  ninja
}

package() {
  cd "$srcdir/pamac-$_pkgvercommit/builddir"
  DESTDIR="$pkgdir" ninja install
  # clean graphic files
  rm -rf "$pkgdir/etc/xdg"
  rm -rf "$pkgdir/usr/share/applications"
  rm -rf "$pkgdir/usr/share/dbus-1/services"
  rm -rf "$pkgdir/usr/share/gnome-shell"
  rm -rf "$pkgdir/usr/share/icons"
}
