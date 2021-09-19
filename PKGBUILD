# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio
pkgver=27.0.1
pkgrel=3
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls'
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
        linux-capture_pipewire.patch::https://github.com/obsproject/obs-studio/commit/ef0540c0d7df64b6cb148c80d566281a4ff3ba5c.patch
	fix_python_binary_loading.patch)
md5sums=('48b51f558858f512928efda0f3aee1a1'
         'ff855407700e3c8e9b956c562528a306'
         '051b90f05e26bff99236b8fb1ad377d1')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/linux-capture_pipewire.patch
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
