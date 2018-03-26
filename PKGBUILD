# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-tray-appindicator
_pkgver=6.2.6
pkgver=$_pkgver
pkgrel=1
pkgdesc="Tray icon using appindicator which feets better in KDE"
depends=('pamac' 'libappindicator-gtk3')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/pamac"
license=('GPL3')
makedepends=('gettext' 'itstool' 'vala>=0.36' 'libappindicator-gtk3' 'meson' 'ninja')
options=(!emptydirs)

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/archive/v$_pkgver.tar.gz"
        #"git-$pkgver-$pkgrel.patch::https://github.com/manjaro/pamac/compare/v$_pkgver...master.patch"
       )
sha256sums=('73c968445ea78b0050b27a44bd634a39a20571d2d80c6bbaa05d6f46fcb1ba0b')

prepare() {
  cd "$srcdir/pamac-$pkgver"
  # patches here
  #patch -p1 -i "$srcdir/git-$pkgver-$pkgrel.patch"

  # adjust version string
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/manager_window.vala
}

build() {
  cd "$srcdir/pamac-$pkgver"
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc -Denable-appindicator=true

  # build
  ninja src/pamac-tray-appindicator
}

package() {
  cd "$srcdir/pamac-$pkgver"
  install -Dm755 "builddir/src/pamac-tray-appindicator" "$pkgdir/usr/bin/pamac-tray-appindicator"
  install -Dm644 "data/applications/pamac-tray-appindicator.desktop" "$pkgdir/etc/xdg/autostart/pamac-tray-appindicator.desktop"
}
# vim:set ts=2 sw=2 et:
