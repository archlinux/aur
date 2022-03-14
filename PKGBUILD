# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio
pkgver=27.2.3
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls' 'rnnoise' 'pciutils'
         'qt5-svg' 'curl' 'jack' 'gtk-update-icon-cache' 'pipewire' 'libxcomposite')
makedepends=('cmake' 'libfdk-aac' 'x264' 'swig' 'python' 'luajit' 'sndio')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'python: scripting support'
            'sndio: Sndio input client'
            'v4l2loopback-dkms: virtual camera support')
source=($pkgname-$pkgver.tar.gz::https://github.com/jp9000/obs-studio/archive/$pkgver.tar.gz
	fix_python_binary_loading.patch)
md5sums=('00e65e70a87e46ade815044cbd658294'
         '051b90f05e26bff99236b8fb1ad377d1')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/fix_python_binary_loading.patch
}

build() {
  cd $pkgname-$pkgver

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_BROWSER=OFF \
    -DBUILD_VST=OFF \
    -DDISABLE_VLC=ON \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" ..

  make
}

package() {
  cd $pkgname-$pkgver/build

  make install DESTDIR="$pkgdir"
}
