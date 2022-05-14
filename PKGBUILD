# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Alexey Yakovenko <waker@users.sourceforge.net>

pkgname=deadbeef
pkgver=1.9.0
pkgrel=1
pkgdesc="Modular GTK audio player for GNU/Linux"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://deadbeef.sourceforge.io/"
license=(GPL2 LGPL2.1 ZLIB)
depends=(gtk3 alsa-lib jansson libdispatch)
makedepends=(libvorbis libmad flac curl imlib2 wavpack libsndfile libcdio libcddb
             libx11 faad2 zlib intltool pkgconfig libpulse libzip libsamplerate
             yasm ffmpeg4.4 clang opusfile mpg123)
optdepends=('alsa-oss: for OSS output plugin'
            'cdparanoia: for cd audio plugin'
            'curl: for last.fm, vfs_curl (shoutcast/icecast), artwork plugins'
            'dbus: for notification daemon support (OSD current song notifications)'
            'faad2: for AAC plugin'
            'ffmpeg4.4: for ffmpeg plugin'
            'flac: for flac plugin'
            'imlib2: for artwork plugin'
            'libcddb: for cd audio plugin'
            'libcdio: for cd audio plugin'
            'libice: optional dependency for gtkui session client support'
            'libmad: for mp3 plugin (mpeg1,2 layers1,2,3)'
            'libogg: for ogg vorbis plugin'
            'libsamplerate: for dsp_libsrc plugin (resampler)'
            'libsidplay: for SID player plugin'
            'libsm: optional dependency for gtkui session client support'
            'libsndfile: for sndfile plugin'
            'libvorbis: for ogg vorbis plugin'
            'libx11: for global hotkeys plugin'
            'libzip: for vfs_zip plugin'
            'mpg123: for MP1/MP2/MP3 playback'
            'opusfile: for opus plugin'
            'pulseaudio: for PulseAudio output plugin'
            'wavpack: for wavpack plugin'
            'yasm: required to build assembly portions of ffap plugin'
            'zlib: for Audio Overload plugin (psf, psf2, etc), GME (for vgz)')
source=("https://sourceforge.net/projects/deadbeef/files/travis/linux/${pkgver}/deadbeef-${pkgver}.tar.bz2"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/deadbeef-makefile.diff")
sha512sums=('ecb37e688170d2f84cb08a92fa5955de01705a60c6cd3aad7bb5dee3c3cbf939a5ba072621164530d7194d1bddcdf956d13b30d7a932603cf737247197da4e73'
            '346dfaf553b13bd7f5dc7f174faeb5ac3abdea3a57a67c1f10cdba0070075847a930ab041aabd685bb3506ae5196423d51e1bef33612cdaaa794a3f4c84596fc')

export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../deadbeef-makefile.diff
  autoreconf -f -i
}

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CC=clang CXX=clang++
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
