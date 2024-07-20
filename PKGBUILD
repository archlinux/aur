# Maintainer: Thomas Lange <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_pkgname=audacious
pkgname=$_pkgname-gtk3
pkgver=4.4
pkgrel=2
pkgdesc="Lightweight, advanced audio player focused on audio quality"
arch=('i686' 'x86_64')
url="https://audacious-media-player.org/"
license=('BSD')
depends=('gtk3' 'glib2')
makedepends=('meson' 'glib2-devel') # for gdbus-codegen
optdepends=('unzip: zipped skins support')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("https://distfiles.audacious-media-player.org/$_pkgname-$pkgver.tar.bz2"
        "wayland.patch::https://github.com/audacious-media-player/audacious/commit/005eae06671dab4331bd0d8316072e98601bf254.patch")
sha256sums=('aadc5d26ea2954236a00153e424094d9e6eb55c5c324c08fd0491b7c2ae2f830'
            'b57bc39652045f2692f48e04e3df81e4bfed4aa293b7aca5e3535b1665ef1bb3')

prepare() {
  cd $_pkgname-$pkgver

  # Make drag and drop work on Wayland
  # https://github.com/audacious-media-player/audacious/issues/1423
  patch -Np1 -i ../wayland.patch
}

build() {
  arch-meson $_pkgname-$pkgver build \
    -Dqt=false \
    -Dbuildstamp='Arch Linux'
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $_pkgname-$pkgver/contrib/audacious.appdata.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 $_pkgname-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
}
