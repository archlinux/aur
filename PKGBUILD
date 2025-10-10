# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mhwaveedit
pkgname="${_pkgname}-git"
pkgver=1.4.24.r149.8a24f6a
pkgrel=3
pkgdesc="A simple and fast GTK2 audio editor (git version)"
arch=(x86_64)
url='https://github.com/magnush/mhwaveedit'
license=(GPL-2.0-or-later)
depends=(glib2 glibc gtk2 hicolor-icon-theme pango sdl12-compat)
makedepends=(alsa-lib git ladspa libpulse libsamplerate libsndfile jack)
groups=(pro-audio)
provides=($_pkgname "$_pkgname=${pkgver//.r*/}")
conflicts=($_pkgname)
source=("$_pkgname::git+https://salsa.debian.org/multimedia-team/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local ver=$(grep ^MHW_VERSION configure | cut -d = -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  CFLAGS+=" -std=gnu17" \
  ./configure \
    --prefix=/usr \
    --with-double-samples \
    --without-arts \
    --without-esound \
    --without-oss
  make
}

package() {
  depends+=(libasound.so libgdk-x11-2.0.so libgtk-x11-2.0.so libglib-2.0.so libgobject-2.0.so
            libjack.so libpango-1.0.so  libpulse.so libsamplerate.so libsndfile.so)
  cd $_pkgname

  make DESTDIR="$pkgdir" install
}
