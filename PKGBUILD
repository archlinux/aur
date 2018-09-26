# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-tray-appindicator
_pkgver=7.1.1
pkgver=$_pkgver
#pkgver=7.1.0rc3
pkgrel=1
#_commit=250cad77f395b9521c0560edd39328ee99095456
pkgrel=1
pkgdesc="Tray icon using appindicator which feets better in KDE"
depends=('pamac' 'libappindicator-gtk3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
makedepends=('gettext' 'itstool' 'vala>=0.36.6' 'libappindicator-gtk3' 'meson' 'ninja' 'git' 'gobject-introspection')
options=(!emptydirs)

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/v$_pkgver/pamac-v$_pkgver.tar.gz")
 #       "pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/pamac-$_commit.tar.gz")

sha256sums=('0f6a2cdc5f713bdae155936c881e1a85725b754e150da8902712047cfead8619')

prepare() {
#  mv "$srcdir/pamac-$_commit" "$srcdir/pamac-v$_pkgver"
  cd "$srcdir/pamac-v$_pkgver"
  # patches here
  #patch -p1 -i "$srcdir/git-$pkgver-$pkgrel.patch"

  # adjust version string
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cd "$srcdir/pamac-v$_pkgver"
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc -Denable-appindicator=true

  # build
  ninja src/pamac-tray-appindicator
}

package() {
  cd "$srcdir/pamac-v$_pkgver"
  install -Dm755 "builddir/src/pamac-tray-appindicator" "$pkgdir/usr/bin/pamac-tray-appindicator"
  install -Dm644 "data/applications/pamac-tray-appindicator.desktop" "$pkgdir/etc/xdg/autostart/pamac-tray-appindicator.desktop"
}
# vim:set ts=2 sw=2 et:
