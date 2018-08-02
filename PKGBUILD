# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio-vaapi
_srcname=obs-studio
pkgver=21.1.2
pkgrel=2
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11'
         'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache'
         'libva')
makedepends=('cmake' 'libfdk-aac' 'libxcomposite' 'x264' 'vlc' 'swig' 'python' 'luajit')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support'
            'luajit: scripting support'
            'python: scripting support'
            'vlc: VLC Media Source support')
source=($_srcname-$pkgver.tar.gz::https://github.com/jp9000/obs-studio/archive/$pkgver.tar.gz
        "https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/1256.patch")
sha256sums=('d6eb32d4ff65879945fc19a639b3ae14a55e6034a45b036e00e5f3dbce0e3d4d'
            '2c6f3e8624a05a6f5de1adc2a534ee85d7af6a6d489938702ca141fe1619b0f5')

prepare() {
  cd $_srcname-$pkgver

  patch -Np1 -i "${srcdir}/1256.patch"
  sed -i '15i #include <QAction>' UI/frontend-plugins/frontend-tools/scripts.cpp  
}

build() {
  cd $_srcname-$pkgver

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" ..

  make
}

package() {
  cd $_srcname-$pkgver/build

  make install DESTDIR="$pkgdir"
}
