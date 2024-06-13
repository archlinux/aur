# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_enable_gtk=true
_enable_qt=true
_buildstamp='Arch Linux'

_pkgname=audacious
pkgname="$_pkgname-git"
pkgver=4.4.r0.g9777eefed
pkgrel=1
epoch=1
pkgdesc="Lightweight, advanced audio player focused on audio quality (git version)"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD')
depends=('glib2')
makedepends=('meson' 'git' 'glib2-devel') # for gdbus-codegen
optdepends=('unzip: zipped skins support')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("git+https://github.com/audacious-media-player/$_pkgname.git")
sha256sums=('SKIP')

if [ "$_enable_gtk" = true ]; then
  depends+=('gtk3')
fi

if [ "$_enable_qt" = true ]; then
  depends+=('qt6-base' 'qt6-imageformats' 'qt6-svg')
fi

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^audacious-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $_pkgname build \
    -D gtk="$_enable_gtk" \
    -D qt="$_enable_qt" \
    -D buildstamp="$_buildstamp"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $_pkgname/contrib/audacious.appdata.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 $_pkgname/COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
}
