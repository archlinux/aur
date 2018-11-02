# Maintainer: Eric Van Albert <eric@van.al>

pkgname=radiance
pkgver=0.6.0
pkgrel=0
pkgdesc='Video art software for live performance'
arch=('x86_64')
url='https://radiance.video'
license=('MIT')
depends=('qt5-base' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'fftw' 'libsamplerate' 'mpv' 'portaudio' 'rtmidi' 'youtube-dl')
makedepends=('cmake')
btrack_pkgver='stable-201810'
source=("https://github.com/zbanks/radiance/archive/${pkgver}.tar.gz"
"https://github.com/zbanks/BTrack/archive/${btrack_pkgver}.tar.gz"
'fix-cmake.patch')
sha256sums=('5b0b780e92f2303d38c447a1efee3ab58ecbb6a106dd54d810945a5d8673ffb0'
'8c265f565358e35f26eb7b38c3caa09d551ddb5b0aff18045a9714e6f1829bcc'
'f2c27d367f3a14b7c8e16f61bedd74b253cb6c6e27e1ed4201fc23d95740183e')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/fix-cmake.patch" "CMakeLists.txt" 
}

build() {
  rm -rf "${srcdir}/${pkgname}-${pkgver}/BTrack"
  mv "${srcdir}/BTrack-${btrack_pkgver}" "${srcdir}/${pkgname}-${pkgver}/BTrack"
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DRADIANCE_SYSTEM_RESOURCES=/usr/share/radiance/
  make -j7
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make install
}
