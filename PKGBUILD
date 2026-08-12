# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=aqualung
pkgver=2.0
pkgrel=2
pkgdesc="High quality music player with gapless support"
arch=(x86_64 i686)
url="https://github.com/jeremyevans/aqualung"
license=(GPL-2.0-only)
depends=(
    alsa-lib
    bzip2
    cairo
    ffmpeg
    flac
    gdk-pixbuf2
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    jack
    lame
    libcddb
    libcdio
    libcdio-paranoia
    liblrdf
    libmad
    libmodplug
    libmpcdec
    libogg
    liboggz
    libpulse
    libsamplerate
    libsndfile
    libstdc++
    libvorbis
    libxml2
    lua52
    mac
    #pango
    sh
    sndio
    speex
    wavpack
    zlib
    )
makedepends=(git)
source=("git+https://github.com/jeremyevans/aqualung.git#tag=${pkgver}"
        "aqualung-avcodec.patch::https://github.com/jeremyevans/aqualung/commit/d830ac5898412280ea02faebe82509a8129dac59.patch"
        aqualung.desktop)
sha256sums=('1f56f79ebeebf56ac16f87974f3979f7e12f8c04536bb75d6f84164aeaeeb3f7'
            '2b6dbc8ea87c0b06705d9974ae6400d3b3d7926b4562c7a3f26aa38e4d30dafc'
            '4d2aba2924b7c0bacbd377a6975f1cdbf09dc67a5d61c36bf2d52bddbab1b3b9')

prepare() {
  cd "aqualung"
  patch -Np1 -i ../aqualung-avcodec.patch

  ./autogen.sh
}

build() {
  # Disable all warnings
  export CFLAGS+=" -w"
  export CXXFLAGS+=" -w"

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
