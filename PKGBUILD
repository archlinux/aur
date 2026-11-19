# Maintainer: staalmannen <staal1978@gmail.com>
pkgname=asunder-qtify
pkgver=3.0.1
pkgrel=1
pkgdesc="Asunder, the GTK 2 CD ripper and encoder, built on Qt with GTK made Qt"
arch=(x86_64 aarch64)
url="http://littlesvr.ca/asunder/"
license=(GPL-2.0-or-later)
depends=(qt6-base glib2 cairo pango libcddb cdparanoia)
makedepends=(gtk-made-qt autoconf automake intltool pkgconf)
optdepends=('lame: MP3 encoding'
            'vorbis-tools: Ogg Vorbis encoding'
            'flac: FLAC encoding'
            'opus-tools: Opus encoding'
            'wavpack: WavPack encoding')
provides=(asunder)
conflicts=(asunder)
# Debian's copy of the release (+ds: without the generated configure, which
# is made here); littlesvr.ca is often unreachable
source=("https://deb.debian.org/debian/pool/main/a/asunder/asunder_${pkgver}+ds.orig.tar.xz")
sha256sums=('b2237b9adb6587fb6fe311d79e3e733bcecc1a630295c61e2f4a0aed302775b9')

prepare() {
  cd "asunder-${pkgver}"
  intltoolize --force
  autoreconf -fi
}

build() {
  cd "asunder-${pkgver}"
  gtk-made-qt-env ./configure --prefix=/usr
  gtk-made-qt-env make
}

check() {
  cd "asunder-${pkgver}"
  mkdir -p "$srcdir/home/.config"
  HOME="$srcdir/home" QT_QPA_PLATFORM=offscreen GTKQT_AUTOQUIT=1500 ./src/asunder
}

package() {
  cd "asunder-${pkgver}"
  make DESTDIR="$pkgdir" install
}
