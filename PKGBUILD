# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=aqualung-git
pkgver=2.0.r0.g706be13
pkgrel=1
pkgdesc="High quality music player with gapless support"
arch=(x86_64 i686)
url="https://github.com/jeremyevans/aqualung"
license=(GPL-2.0-only)
depends=(gtk3 libxml2 alsa-lib sndio jack libpulse liboggz
         ffmpeg libvorbis libsndfile lua52 wavpack libcdio-paranoia
         libmad flac liblrdf libmpcdec libsamplerate libcddb speex lame libmodplug

         # namcap implicit depends
         glibc gcc-libs glib2 bzip2 zlib libogg gdk-pixbuf2 cairo pango libcdio hicolor-icon-theme)
makedepends=(git)
provides=(aqualung)
conflicts=(aqualung)
source=("git+https://github.com/jeremyevans/aqualung.git"
        aqualung.desktop)
sha256sums=('SKIP'
            '4d2aba2924b7c0bacbd377a6975f1cdbf09dc67a5d61c36bf2d52bddbab1b3b9')

pkgver() {
  cd "aqualung"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "aqualung"
  # Enlarge MAX_SAMPLERATE
  sed -i 's/MAX_SAMPLERATE 96000/MAX_SAMPLERATE 192000/g' src/core.h
  ./autogen.sh
}

build() {
  cd "aqualung"
  ./configure \
    --prefix=/usr \
    --without-ifp

  make
}

package() {
  cd "aqualung"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "src/img/icon_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/aqualung.png"
  install -Dm644 "src/img/icon_24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/aqualung.png"
  install -Dm644 "src/img/icon_32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/aqualung.png"
  install -Dm644 "src/img/icon_48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/aqualung.png"
  install -Dm644 "src/img/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/aqualung.png"
  install -Dm644 "${srcdir}/aqualung.desktop" "${pkgdir}/usr/share/applications/aqualung.desktop"
}

