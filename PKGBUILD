# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
# https://gitlab.manjaro.org/packages/extra/pamac
pkgname=pamac-cli
pkgver=9.4.2
pkgrel=1
_pkgfixver=$pkgver

_commit='227b4ec121eeee2ea5f8ca605f5cda9d6f7a8b59'
sha256sums=('55dc8d6d38f011513915a717f437577c4a31576ee6570a08d835bb08a3a28ff7'
            'aeeb4b139a301473a6601b03c2a6c7f2c5532b8a1f9a2da419ae3ad4de018800')

pkgdesc="Pamac cli frontend for libalpm"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'pacman>=5.2' 'appstream-glib' 'archlinux-appstream-data' 'git')
optdepends=('')
makedepends=('gettext' 'itstool' 'vala>=0.36.6' 'meson' 'ninja' 'gobject-introspection')
conflicts=('pamac' 'pamac-aur' 'pamac-aur-git')
provides=('pamac')
replaces=('pamac')
options=(!emptydirs)
install=

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/pamac-$_commit.tar.gz" "meson.build")

prepare() {
  cd "$srcdir/pamac-$_commit"

  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cp -f "$srcdir/meson.build" "$srcdir/pamac-$_commit/src/meson.build"
  cd "$srcdir/pamac-$_commit"
  mkdir -p builddir
  cd builddir
  meson --buildtype=release --prefix=/usr --sysconfdir=/etc

  # build
  ninja
}

package() {
  cd "$srcdir/pamac-$_commit/builddir"
  DESTDIR="$pkgdir" ninja install
  # clean graphic files
  rm -rf "$pkgdir/etc/xdg"
  rm -rf "$pkgdir/usr/share/applications"
  rm -rf "$pkgdir/usr/share/dbus-1/services"
  rm -rf "$pkgdir/usr/share/gnome-shell"
  rm -rf "$pkgdir/usr/share/icons"
}
