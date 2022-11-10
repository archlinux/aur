# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Dan Vratil <vratil@progdansoft.com>

pkgname=k3b-git
pkgver=23.03.70.r6861.087154c11
pkgrel=1
pkgdesc="Feature-rich and easy to handle CD burning application. (Git version)"
arch=('x86_64')
license=('GPL')
url='https://kde.org/applications/en/multimedia/org.kde.k3b'
depends=('knewstuff'
         'kfilemetadata'
         'knotifyconfig'
         'kcmutils'
         'libkcddb'
         'libdvdread'
         'libmpcdec'
         'libsamplerate'
         'libmad'
         )
makedepends=('git'
             'cmake'
             'extra-cmake-modules'
             'kdoctools'
             'python'
             )
optdepends=('cdrdao: for CD DAO mode burning support'
            'libburn: for CD, DVD & BluRay burning support'
            'dvd+rw-tools: for CD, DVD & BluRay burning support'
            'normalize: for WAV normalization'
            'vcdimager: for VCD burning support'
            'transcode: for advanced MPEG conversion support'
            'sox: for encode audio files in formats such as AIFF or VOC'
            'emovix: for bootable multimedia CD/DVD support'
            )
provides=('k3b')
conflicts=('k3b')
source=('git+https://invent.kde.org/multimedia/k3b.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd k3b
  _ver="$(cat CMakeLists.txt | grep -m3 -e RELEASE_SERVICE_VERSION_MAJOR -e RELEASE_SERVICE_VERSION_MINOR -e RELEASE_SERVICE_VERSION_MICRO | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  sed -e 's|Sndfile|SndFile|g' \
      -i k3b/cmake/modules/FindSndfile.cmake \
      -i k3b/CMakeLists.txt

  sed 's|MUSE |Muse |g' -i k3b/cmake/modules/FindMuse.cmake
}

build() {
  cmake -S k3b -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=/usr/lib/k3b \
    -DBUILD_TESTING=OFF \
    -DQt5WebKitWidgets_FOUND=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
