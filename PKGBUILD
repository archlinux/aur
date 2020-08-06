# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio
pkgver=25.0.8
pkgrel=2
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls'
         'qt5-svg' 'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache')
makedepends=('cmake' 'libfdk-aac' 'libxcomposite' 'x264' 'vlc' 'swig' 'python' 'luajit')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'python: scripting support'
            'vlc: VLC Media Source support')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/jp9000/obs-studio/archive/$pkgver.tar.gz
  https://github.com/obsproject/obs-studio/commit/8a1429e29ebd6bf31ad6ae63c6992e2c03893767.patch
)
md5sums=('269e7a31b9b59f0eaf06f1c90a2e4573'
         'a8ce802b8ab9a79dd22dcbc9c1c311ad')

prepare() {
  cd $pkgname-$pkgver

  patch -Np1 -i ../8a1429e29ebd6bf31ad6ae63c6992e2c03893767.patch # GCC 10
}

build() {
  cd $pkgname-$pkgver

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" ..

  make
}

package() {
  cd $pkgname-$pkgver/build

  make install DESTDIR="$pkgdir"
}
