# Maintainer: Daniel Vrátil <me@dvratil.cz>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Patryk Kowalczyk < patryk at kowalczyk dot ws>

_basename=spice
pkgname=${_basename}-gstreamer
pkgver=0.15.2
pkgrel=1
pkgdesc="SPICE server with GStreamer support"
arch=('x86_64')
url="https://www.spice-space.org"
license=('LGPL2.1')
depends=('pixman' 'opus' 'libjpeg-turbo' 'glib2' 'libsasl' 'lz4' 'spice-protocol' 'libcacard' 'gstreamer')
makedepends=('meson' 'python-six' 'python-pyparsing')
checkdepends=('gdk-pixbuf2' 'glib-networking')
provides=('libspice-server.so' "$_basename")
conflicts=("$_basename")
source=("https://www.spice-space.org/download/releases/spice-server/$_basename-$pkgver.tar.bz2"{,.sig})
sha256sums=('6d9eb6117f03917471c4bc10004abecff48a79fb85eb85a1c45f023377015b81'
            'SKIP')
validpgpkeys=('206D3B352F566F3B0E6572E997D9123DE37A484F') # Victor Toso <victortoso@redhat.com>

prepare() {
  cd ${_basename}-$pkgver
  sed -i "s/if not version_info.contains('git')/if version_info.length() >= 4/" server/meson.build

  sed -i "/meson-dist/d" meson.build
}

build() {
  arch-meson "${_basename}-$pkgver" build -D gstreamer=1.0
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

