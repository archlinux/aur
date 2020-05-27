# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-tray-appindicator

pkgver=9.5.1
pkgrel=1
_pkgfixver=$pkgver

_commit='423f9af2ff6d26287a9d275f72947d58c9b600d4'
sha256sums=('7e442361ceb22df64010d67c7fe65c38877a2dfb022afacfa805dd08eda45544')

pkgdesc="Tray icon using appindicator which feets better in KDE"
depends=('pamac' 'libappindicator-gtk3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
makedepends=('gettext' 'itstool' 'vala>=0.36.6' 'libappindicator-gtk3' 'meson' 'ninja' 'git' 'gobject-introspection' 'xorgproto')
options=(!emptydirs)

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/pamac-$_commit.tar.gz")

prepare() {
  cd "$srcdir/pamac-$_commit"

  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cd "$srcdir/pamac-$_commit"
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc -Denable-appindicator=true

  # build
  ninja src/pamac-tray-appindicator
}

package() {
  cd "$srcdir/pamac-$_commit"
  install -Dm755 "builddir/src/pamac-tray-appindicator" "$pkgdir/usr/bin/pamac-tray-appindicator"
  install -Dm644 "data/applications/pamac-tray-appindicator.desktop" "$pkgdir/etc/xdg/autostart/pamac-tray-appindicator.desktop"
}
# vim:set ts=2 sw=2 et:
