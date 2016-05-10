# Maintainer: Nathan Lowe <techwiz96@gmail.com>
# Upstream URL: https://github.com/stanfieldr/ghetto-skype
#
# Based off of the PKGBUILD for atom-editor
# https://aur.archlinux.org/packages/atom-editor/
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/techwiz24/aur-ghetto-skype

pkgname=ghetto-skype
pkgver=1.0.1
pkgrel=1
pkgdesc='skype-web in an electron wrapper, with an indicator and desktop notifications'
arch=('x86_64')
url='https://github.com/stanfieldr/ghetto-skype'
license=('GPLv3')
depends=('libappindicator-gtk2')
provides=('skype')
conflicts=('skype')
makedepends=('git' 'npm')
install=ghetto-skype.install
source=("https://github.com/stanfieldr/ghetto-skype/archive/v${pkgver}.tar.gz")
sha256sums=('191de6e42f16f6b4d90550073247f6745faa7626f3e09dd60821b5c48bec6892')

prepare() {
  cd "ghetto-skype-$pkgver"

  sed -i -e "s|^INSTALLDIR=.*\$|INSTALLDIR=$srcdir/ghetto-skype-build|gm" \
         -e "s|^\s*ln -sfn.*$||gm" Makefile
}

build() {
  cd "$srcdir/ghetto-skype-$pkgver"

  make install
}

package() {
  cd "$srcdir/ghetto-skype-build"

  mkdir -p "$pkgdir/opt/ghetto-skype"
  cp -R . "$pkgdir/opt/ghetto-skype"

  rm "$pkgdir/opt/ghetto-skype/Makefile"
  #TODO: There are still a bunch of references to $srcdir in the package because
  #      of the node_modules directory. We should look into how other node apps
  #      get packaged to prevent this warning.

  install -Dm644 "$srcdir/ghetto-skype-build/assets/skype.desktop" "$pkgdir/usr/share/applications/ghetto-skype.desktop"
  install -Dm644 "$srcdir/ghetto-skype-build/assets/tray/skype.png" "$pkgdir/usr/share/pixmaps/ghetto-skype.png"
  install -Dm644 "$srcdir/ghetto-skype-build/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
