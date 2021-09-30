# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audacity-3
pkgver=3.0.5
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('x86_64')
url="https://audacityteam.org"
license=('GPL2' 'CCPL')
groups=('pro-audio')
provides=(audacity)
conflicts=(audacity)
# upstream hard codes/vendors portaudio/portmidi
# https://github.com/audacity/audacity/issues/522
depends=('expat' 'gcc-libs' 'gdk-pixbuf2' 'glibc' 'libmad'
'libsoxr' 'soundtouch' 'wxgtk3')
makedepends=('alsa-lib' 'cmake' 'conan' 'ffmpeg' 'flac' 'glib2' 'gtk3' 'jack'
'lame' 'libid3tag' 'libogg' 'libsndfile' 'libvorbis' 'lilv' 'lv2' 'portsmf'
'suil' 'twolame' 'vamp-plugin-sdk')
optdepends=('ffmpeg: additional import/export capabilities')
source=("https://github.com/audacity/audacity/archive/Audacity-${pkgver}.tar.gz")
sha512sums=('d7585bf1b1715e54a79ab2c940dca91ec3041a97f02c5483eff9321bb7375401f868b7c394e06cf5e956017974ce21a0f0203c84d3a9b71745deb9a698b79131')

prepare() {
  mv -v "audacity-Audacity-${pkgver}" "audacity-${pkgver}"
  mkdir "audacity-${pkgver}/build"
}

build() {
  cd "audacity-${pkgver}/build"

  # CXXFLAGS: https://stackoverflow.com/a/68149587
  CXXFLAGS="-include /usr/include/c++/11.1.0/limits" cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -Daudacity_use_sndfile=system \
    -Daudacity_use_ffmpeg=loaded \
    -Daudacity_use_expat=system \
    -Daudacity_use_libmp3lame=system \
    -Daudacity_use_soxr=system \
    -Daudacity_use_portaudio=local \
    -Daudacity_use_midi=local \
    -Daudacity_use_flac=local \
    -Daudacity_use_id3tag=local \
    -Daudacity_use_sbsms=local \
    -Daudacity_use_soundtouch=local \
    -Daudacity_use_twolame=local \
    -Daudacity_use_vorbis=local \
    -Daudacity_use_lv2=local \
    ..
  make -j4
}

package() {
  depends+=('libFLAC.so' 'libFLAC++.so' 'libasound.so' 'libgdk-3.so'
  'libglib-2.0.so' 'libgobject-2.0.so' 'libgtk-3.so' 'libid3tag.so'
  'libjack.so' 'liblilv-0.so' 'libogg.so' 'libsndfile.so' 'libsuil-0.so'
  'libtwolame.so' 'libvamp-hostsdk.so' 'libvorbis.so' 'libvorbisenc.so'
  'libvorbisfile.so' 'libportSMF.so')
  cd "audacity-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  # install libnyquist plugins, missing since 2.4.0:
  # https://bugs.archlinux.org/task/66733
  install -vDm 644 ../plug-ins/*.ny -t "${pkgdir}/usr/share/audacity/plug-ins"
  # install missing *.lsp files for nyquist plugins, missing since 2.4.0:
  # https://bugs.archlinux.org/task/66739
  install -vDm 644 ../nyquist/*.lsp -t "${pkgdir}/usr/share/audacity/nyquist"
}
