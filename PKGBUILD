# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio-ftl
pkgver=26.1.0
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording (with FTL System patch)"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls'
         'qt5-svg' 'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache' 'ftl-sdk')
makedepends=('cmake' 'libfdk-aac' 'libxcomposite' 'x264' 'vlc' 'swig' 'python' 'luajit')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'python: scripting support'
            'vlc: VLC Media Source support')
provides=("obs-studio")
conflicts=("obs-studio")
source=($pkgname-$pkgver.tar.gz::https://github.com/jp9000/obs-studio/archive/$pkgver.tar.gz
	fix_python_binary_loading.patch
	ftl_use_system.diff)
md5sums=('f8bb9216ece8587f2067ead1ef12a7c9'
         '051b90f05e26bff99236b8fb1ad377d1'
         '832c3fac1da5a54493254287fc4a0392')

prepare() {
  cd obs-studio-$pkgver
  patch -Np1 < "$srcdir"/fix_python_binary_loading.patch
  patch -Np1 < "$srcdir"/ftl_use_system.diff
}

build() {
  cd obs-studio-$pkgver

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_CAPTIONS=ON \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" ..

  make
}

package() {
  cd obs-studio-$pkgver/build

  make install DESTDIR="$pkgdir"
}
