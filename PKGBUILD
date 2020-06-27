# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=audacity
pkgname=$_pkgname-git
pkgver=2.4.2.r0.g16d52f63a
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
url="http://www.audacityteam.org/"
license=('GPL')
depends=('expat'
    'gcc-libs'
    'gdk-pixbuf2'
    'glibc'
    'libmad'
    'libFLAC++.so'
    'libFLAC.so'
    'libasound.so'
    'libgdk-3.so'
    'libsoxr'
    'soundtouch'
    'wxgtk3'
    'libglib-2.0.so'
    'libgobject-2.0.so'
    'libgtk-3.so'
    'libid3tag.so'
    'libjack.so'
    'liblilv-0.so'
    'libogg.so'
    'libportSMF.so'
    'libsndfile.so'
    'libsuil-0.so'
    'libtwolame.so'
    'libvamp-hostsdk.so'
    'libvorbis.so'
    'libvorbisenc.so'
    'libvorbisfile.so')
makedepends=('alsa-lib'
    'cmake'
    'ffmpeg'
    'flac'
    'git'
    'glib2'
    'gtk3'
    'jack'
    'lame'
    'libid3tag'
    'libogg'
    'libsndfile'
    'libvorbis'
    'lilv'
    'lv2'
    'portsmf'
    'suil'
    'twolame'
    'vamp-plugin-sdk')
optdepends=('ffmpeg: additional import/export capabilities'
            'audacity-extras: nyquist plugins for audacity')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/$_pkgname/$_pkgname.git")
sha1sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
}

build() {
  mkdir $_pkgname/build
  cd $_pkgname/build
  CC=clang cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    audacity_use_sndfile:STRING=system \
    audacity_use_ffmpeg:STRING=loaded \
    audacity_use_expat:STRING=system \
    audacity_use_lame:STRING=local \
    audacity_use_portaudio:STRING=local \
    audacity_use_midi:STRING=local \
    audacity_use_flac:STRING=system \
    audacity_use_id3tag:STRING=system \
    audacity_use_sbsms:STRING=local \
    audacity_use_soundtouch:STRING=system \
    audacity_use_twolame:STRING=system \
    audacity_use_vorbis:STRING=system \
    audacity_use_lv2:STRING=local \
    ..
    cmake --build .
  make .
}

package() {
  cd $_pkgname/build
  make DESTDIR="${pkgdir}" install
  cd .. 
  install -vDm 644 plug-ins/*.ny -t "${pkgdir}/usr/share/${pkgname}/plug-ins"
}
