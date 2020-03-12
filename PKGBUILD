# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
# https://gitlab.manjaro.org/packages/extra/pamac
pkgname=pamac-cli
pkgver=9.3.94
pkgrel=1
_pkgfixver=$pkgver

_pkgvercommit=v$pkgver
_pkgvercommit='d92cba8d7b94141cb7d4bd7ec9595d2c9bce20ff'
sha256sums=('567953d041f1c35a46808d394b08df78e164c94cf20ccc1da24e3807e914b98e'
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
