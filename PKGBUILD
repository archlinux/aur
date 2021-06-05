# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio
pkgver=27.0.0
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls'
         'qt5-svg' 'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache')
makedepends=('cmake' 'libfdk-aac' 'libxcomposite' 'x264' 'vlc' 'swig'
             'python' 'luajit' 'pipewire' 'sndio')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'pipewire: obs-plugins'
            'python: scripting support'
            'sndio: obs-plugins'
            'v4l2loopback-dkms: virtual camera support'
            'vlc: VLC Media Source support')
source=($pkgname-$pkgver.tar.gz::https://github.com/jp9000/obs-studio/archive/$pkgver.tar.gz
	fix_python_binary_loading.patch)
md5sums=('cd3da7551dc4a007c6b01145d037b910'
         '051b90f05e26bff99236b8fb1ad377d1')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/fix_python_binary_loading.patch
}

build() {
  cd $pkgname-$pkgver

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_CAPTIONS=ON \
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
