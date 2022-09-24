# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio
pkgver=28.0.2
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls' 'rnnoise' 'pciutils'
         'qt6-svg' 'curl' 'jack' 'gtk-update-icon-cache' 'pipewire' 'libxcomposite')
makedepends=('cmake' 'libfdk-aac' 'x264' 'swig' 'python' 'luajit' 'sndio')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'python: scripting support'
            'sndio: Sndio input client'
            'v4l2loopback-dkms: virtual camera support')
source=($pkgname-$pkgver.tar.gz::https://github.com/jp9000/obs-studio/archive/$pkgver.tar.gz
        fix_python_binary_loading.patch
        ignore_unused_submodules.patch)
md5sums=('748258d94e9cfadc24af82d57fe24d66'
         '051b90f05e26bff99236b8fb1ad377d1'
         'a898a94ad62d9d029c63f1d1379515d5')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/fix_python_binary_loading.patch
  patch -Np1 < "$srcdir"/ignore_unused_submodules.patch
}

build() {
  cd $pkgname-$pkgver

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_BROWSER=OFF \
    -DENABLE_VST=OFF \
    -DENABLE_VLC=OFF \
    -DENABLE_NEW_MPEGTS_OUTPUT=OFF \
    -DENABLE_AJA=OFF \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" ..

  make
}

package() {
  cd $pkgname-$pkgver/build

  make install DESTDIR="$pkgdir"
}
