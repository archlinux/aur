# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=aqualung-git
pkgver=2.0.r7.gb2328bd
pkgrel=1
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
  #sed -i 's/MAX_SAMPLERATE 96000/MAX_SAMPLERATE 192000/g' src/core.h
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

