# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=aqualung
pkgver=1.0
pkgrel=4
pkgdesc="High quality music player w/ gapless support"
arch=(i686 x86_64)
url="http://aqualung.jeremyevans.net/"
license=(GPL)
depends=(gtk2 libxml2 alsa-lib sndio jack libpulse liboggz libusb-compat
         libifp ffmpeg libvorbis libsndfile lua52 wavpack libcdio-paranoia
         libmad flac liblrdf libmpcdec libsamplerate)
makedepends=(gcc8 ladspa libcddb speex lame libmodplug)
optdepends=('libcddb: CDDB / FreeDB support'
            'speex: Oggz speex support (playback)'
            'lame: MP3 audio support (encode)'
            'libmodplug: MOD files support (playback .mod .s3m .xm .it ...)')
source=("https://github.com/jeremyevans/aqualung/releases/download/1.0/${pkgname}-${pkgver}.tar.gz"
        "aqualung-libavcodec-API-55.diff::https://github.com/jeremyevans/aqualung/commit/3f60efe3dbab8e9d2c07a7b183fd009b3c999d60.diff"
        aqualung.desktop)
sha256sums=('c286c1432c1475127f4e9525702bcb486ed85fc62539bd3ef344d92333e84347'
            '9bd0cc8059d28e1e0c2c162c975f98833078df81c50b4a8184989ee93bfb51c3'
            '4d2aba2924b7c0bacbd377a6975f1cdbf09dc67a5d61c36bf2d52bddbab1b3b9')

export CC=/usr/bin/gcc-8 CXX=/usr/bin/g++-8

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i ../aqualung-libavcodec-API-55.diff
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "src/img/icon_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
  install -Dm644 "src/img/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/aqualung.desktop" "${pkgdir}/usr/share/applications/aqualung.desktop"
}
