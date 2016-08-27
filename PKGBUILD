# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Dan Vratil <vratil@progdansoft.com>

pkgname=k3b-git
pkgver=2.10.0.r5997.7d5de6f
pkgrel=1
pkgdesc="Feature-rich and easy to handle CD burning application. (Git version)"
arch=('i686' 'x86_64')
license=('GPL')
url='http://k3b.sourceforge.net'
depends=('qt5-webkit'
         'knewstuff'
         'kfilemetadata'
         'knotifyconfig'
         'kcmutils'
         'libkcddb-git'
         'libsamplerate'
         'hicolor-icon-theme'
         )
makedepends=('git'
             'cmake'
             'extra-cmake-modules'
             'kdoctools'
             'flac'
             'libmpcdec'
             'ffmpeg'
             'libmad'
             'libdvdread'
             'libvorbis'
             'musicbrainz'
             )
optdepends=('cdrdao: for CD DAO mode burning support'
            'cdrkit: for CD burning support'
            'cdrtools: for CD burning support'
            'dvd+rw-tools: for DVD burning support'
            'normalize: for WAV normalization'
            'vcdimager: for VCD burning support'
            'transcode: for advanced MPEG conversion support'
            'sox: for encode audio files in formats such as AIFF or VOC'
            'emovix: for bootable multimedia CD/DVD support'
            'taglib: Read and write tags in audio files'
            'flac: Needed for the Flac audio decoder plugin'
            'libmpcdec: Needed for the Musepack audio decoder plugin'
            'ffmpeg: Needed for the K3b FFmpeg decoder plugin which can decode virtually all audio types'
            'libmad: Needed for the mp3 audio decoder plugin'
            'libsndfile: Needed for the libsndfile audio decoder plugin'
            'libdvdread: Reading DVD video disks'
            'lame: Needed for the lame mpf encoder encoder plugin'
            'libvorbis: Needed for the K3b Ogg Vorbis decoder and encoder plugins'
            'musicbrainz: Provide information about the CD, about the artist or about related information'
            )
provides=('k3b')
conflicts=('k3b')
source=('git://anongit.kde.org/k3b.git')
sha1sums=('SKIP')

pkgver() {
  cd k3b
  _ver="$(cat CMakeLists.txt | grep -m3 -e _VERSION_MAJOR -e _VERSION_MINOR -e _VERSION_RELEASE | sed 's|K3B|KEB|' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../k3b \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
