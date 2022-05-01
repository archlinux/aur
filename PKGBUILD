# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
# Contributor: Vladimir Protasov <eoranged@ya.ru>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname='moc-pulse'
_pkgname='moc'
pkgver=2.5.2
pkgrel=8
pkgdesc='An ncurses console audio player with support for pulseaudio'
arch=('x86_64')
url="https://moc.daper.net/"
license=('GPL')
depends=('libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file' 'sndio' 'pulseaudio')
makedepends=('speex' 'ffmpeg4.4' 'taglib' 'libmpcdec' 'wavpack' 'libmodplug' 'faad2')
optdepends=('speex: for using the speex plugin'
	          'ffmpeg4.4: for using the ffmpeg plugin'
	          'taglib: for using the musepack plugin'
	          'libmpcdec: for using the musepack plugin'
            'wavpack: for using the wavpack plugin'
            'faad2: for using the aac plugin'
	          'libmodplug: for using the modplug plugin')
provides=('moc')
conflicts=('moc')
source=("https://sources.voidlinux-ppc.org/moc-2.5.2/${_pkgname}-${pkgver}.tar.bz2"
        'pulseaudio.patch'
        'moc-ffmpeg4.patch'
        'moc-https.patch'
        '0001-Workaround-mbsrtowcs-fortify-crash-in-GLIBC-2.35.patch')
sha1sums=('9d27a929b63099416263471c16367997c0ae6dba'
          '5c6385760ba40ee8a330d28d520c44eac2cbbae1'
          '007a0580ac754e1c318a0d0b6f0d403883797eaf'
          'e3362ddd41126e2be874cd372a053fdaccf0f616'
          'd3673707b2d96c34287042dc26698b2c5a00952a')
# validpgpkeys=('59359B80406D9E73E80599BEF3121E4F2885A7AA')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Fix build with ffmpeg 4 (taken from official release on ArchLinux)
  patch -p0 -i ../moc-ffmpeg4.patch
  # Allow https for urls https://moc.daper.net/node/1872 (taken from official release on ArchLinux)
  patch -p0 -i ../moc-https.patch
  # Add pulseaudio backend
  patch -p1 -i ../pulseaudio.patch

  # HOTFIX for GLIBC 2.35 buffer overflow error
  patch -p1 -i ../0001-Workaround-mbsrtowcs-fortify-crash-in-GLIBC-2.35.patch

  # reconfigure the build system
  autoreconf -i -f
}

build() {
  cd "${_pkgname}-${pkgver}"

  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

  ./configure --prefix=/usr --without-rcc \
    --with-pulse --with-oss --with-alsa --with-jack --with-aac \
    --with-mp3 --with-musepack --with-vorbis --with-flac \
    --with-wavpack --with-sndfile --with-modplug --with-ffmpeg \
    --with-speex --with-samplerate --with-curl  --disable-cache \
    --disable-debug
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2
