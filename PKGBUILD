# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=k3b-frameworks-git
pkgver=2.9.90.r5959.2699da9
pkgrel=1
pkgdesc="Feature-rich and easy to handle CD burning application. KF5 Frameworks branch. (Git version)"
arch=('i686' 'x86_64')
url='http://k3b.sourceforge.net'
license=('GPL')
depends=('qt5-webkit'
         'kfilemetadata'
         'knotifyconfig'
         'kcmutils'
         'libkcddb-frameworks-git'
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
             'musicbrainz'
             'libvorbis'
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
source=('git://anongit.kde.org/k3b.git#branch=kf5'
        '0001-Fixed-compilation-with-newer-ffmpeg-libav.patch::https://git.reviewboard.kde.org/r/122569/diff/raw/')
sha1sums=('SKIP'
          '8ee47b04e92499d484c49e33dd33dabdf53025c9'
          )

pkgver() {
  cd k3b
  _ver="$(cat CMakeLists.txt | grep -m3 -e 'K3B_VERSION_MAJOR' -e 'K3B_VERSION_MINOR' -e 'K3B_VERSION_RELEASE' | sed 's|K3B|KEB|' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  cd k3b
  patch -p1 -i "${srcdir}/0001-Fixed-compilation-with-newer-ffmpeg-libav.patch"
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
