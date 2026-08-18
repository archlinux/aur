# Maintainer: Christopher Arndt <aur -at-chrisarndt -dot- de>
# Contributor: Alex Palaistras <alex+archlinux@deuill.org>

_pkgname=elektroid
pkgname=$_pkgname-git
pkgver=3.4.r7.gbf5a0f90
pkgrel=1
pkgdesc='A sample and MIDI manager for Elektron devices and other synths and effects'
arch=(aarch64 x86_64)
url='https://dagargo.github.io/elektroid/'
license=(GPL-3.0-only BSD-3-Clause)
depends=(
  glibc
  gtk3
  hicolor-icon-theme
  json-glib
  libpulse
  libsamplerate
  libsndfile
  libzip
  rtmidi
  rubberband
  zlib
)
makedepends=(git)
checkdepends=(cunit)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/dagargo/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  autoreconf --install
}

build() {
  cd $_pkgname
  export CFLAGS+=" -std=gnu17"
  export RTMIDI=yes
  ./configure --prefix=/usr
  make
}

check() {
  cd $_pkgname
  make check
}

package() {
  cd $_pkgname
  depends+=(
    libatk-1.0.so
    libcairo-gobject.so
    libcairo.so
    libfftw3.so
    libgdk-3.so
    libgdk_pixbuf-2.0.so
    libgio-2.0.so
    libglib-2.0.so
    libgobject-2.0.so
    libgtk-3.so
    libharfbuzz.so
    libjson-glib-1.0.so
    libpango-1.0.so
    libpangocairo-1.0.so
    libpulse-mainloop-glib.so
    libpulse.so
    librtmidi.so
    librubberband.so
    libsamplerate.so
    libsndfile.so
    libzip.so
    libz.so
  )
  make DESTDIR="$pkgdir" install
  # Documentation
  install -vDm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 docs/images/screenshot.png -t "$pkgdir"/usr/share/doc/$pkgname/docs/images
  mv "$pkgdir"/usr/share/elektroid/{AUTHORS,THANKS} "$pkgdir"/usr/share/doc/$pkgname
  # Licenses
  install -vdm 755 "$pkgdir"/usr/share/licenses/$pkgname
  mv "$pkgdir"/usr/share/elektroid/volca_sample_sdk-COPYING "$pkgdir"/usr/share/licenses/$pkgname
}
