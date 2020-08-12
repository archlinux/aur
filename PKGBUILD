# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-tray-appindicator

pkgver=9.5.7
pkgrel=1
_pkgfixver=$pkgver

_commit='647b30bd208488b2281d16e69036be886495d9f3'
sha256sums=('e74743d44dfe1f239044e00a91182411a48ced079480da37088610f1dd20c993')

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
