# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-tray-appindicator

pkgver=7.3.4
pkgrel=1
_pkgfixver=$pkgver

_pkgvercommit=v$pkgver
#_pkgvercommit=42b90c025eba29adc139c3a3f0b1c0c06d42f5e9
sha256sums=('14dff6fde59f2bc3e38dee85c2e7a4090fefd1b33b27a713819f4efb26a1460d')

pkgdesc="Tray icon using appindicator which feets better in KDE"
depends=('pamac' 'libappindicator-gtk3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
makedepends=('gettext' 'itstool' 'vala>=0.36.6' 'libappindicator-gtk3' 'meson' 'ninja' 'git' 'gobject-introspection')
options=(!emptydirs)

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_pkgvercommit/pamac-$_pkgvercommit.tar.gz")

prepare() {
  cd "$srcdir/pamac-$_pkgvercommit"

  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cd "$srcdir/pamac-$_pkgvercommit"
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc -Denable-appindicator=true

  # build
  ninja src/pamac-tray-appindicator
}

package() {
  cd "$srcdir/pamac-$_pkgvercommit"
  install -Dm755 "builddir/src/pamac-tray-appindicator" "$pkgdir/usr/bin/pamac-tray-appindicator"
  install -Dm644 "data/applications/pamac-tray-appindicator.desktop" "$pkgdir/etc/xdg/autostart/pamac-tray-appindicator.desktop"
}
# vim:set ts=2 sw=2 et:
