# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Dan Vratil <vratil@progdansoft.com>

pkgname=k3b-git
pkgver=18.07.70.r6307.059d0da2e
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
         'libkcddb'
         'libdvdread'
         'libmpcdec'
         'libsamplerate'
         'libmad'
         'hicolor-icon-theme'
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
source=('git://anongit.kde.org/k3b.git')
sha256sums=('SKIP')

pkgver() {
  cd k3b
  _ver="$(cat CMakeLists.txt | grep -m3 -e _VERSION_MAJOR -e _VERSION_MINOR -e _VERSION_MICRO | sed 's|K3B|KEB|' | grep -o "[[:digit:]]*" | paste -sd'.')"
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
    -DKDE_INSTALL_LIBEXECDIR=/usr/lib/k3b \
    -DBUILD_TESTING=OFF \
    -DK3B_ENABLE_PERMISSION_HELPER=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
