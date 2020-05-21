# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audacity-git
_pkgname=audacity
pkgver=2.4.1.r0.g1322b40a9
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
url="http://www.audacityteam.org/"
license=('GPL')
depends=('expat' 'gcc-libs' 'gdk-pixbuf2' 'glibc' 'libmad'
         'libsoxr' 'soundtouch' 'wxgtk3')
makedepends=('alsa-lib' 'cmake' 'ffmpeg' 'flac' 'git' 'glib2' 'gtk3' 'jack' 'lame'
         'libid3tag' 'libogg' 'libsndfile' 'libvorbis' 'lilv' 'lv2' 'portsmf' 'suil'
         'twolame' 'vamp-plugin-sdk')
optdepends=('ffmpeg: additional import/export capabilities'
            'audacity-extras: nyquist plugins for audacity')
provides=('audacity')
conflicts=('audacity')
source=("$_pkgname::git+https://github.com/audacity/audacity.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
}

prepare() {
  cd $_pkgname
  autoreconf -vfi
}

build() {
  cd $_pkgname
  WX_CONFIG=wx-config-gtk3 ./configure --prefix="/usr" \
    --with-libsndfile="system" \
    --with-ffmpeg="system" \
    --with-expat="system" \
    --with-lame="system" \
    --with-libsoxr="system" \
    --with-portaudio \
    --with-portmidi \
    --with-libflac \
    --with-libid3tag \
    --with-libsamplerate \
    --with-sbsms \
    --with-soundtouch \
    --with-libtwolame \
    --with-libvorbis \
    --with-lv2
  make
}

package() {
  depends+=('libFLAC.so' 'libFLAC++.so' 'libasound.so' 'libgdk-3.so'
    'libglib-2.0.so' 'libgobject-2.0.so' 'libgtk-3.so' 'libid3tag.so'
    'libjack.so' 'liblilv-0.so' 'libogg.so' 'libsndfile.so' 'libsuil-0.so'
    'libtwolame.so' 'libvamp-hostsdk.so' 'libvorbis.so' 'libvorbisenc.so'
    'libvorbisfile.so' 'libportSMF.so')

  cd $_pkgname
  make DESTDIR="${pkgdir}" install
}
