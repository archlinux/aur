# Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

_qmmpver=1.0.6

pkgname=qmmp-plugin-youtube
pkgver=0.1
pkgrel=1
pkgdesc="Plugin for Qt-based Multimedia Player (Qmmp) to search and play musics directly from YouTube"
arch=('i686' 'x86_64')
url="https://github.com/rigon/qmmp-plugin-youtube"
license=('GPL')
depends=('qmmp' 'python>=3.5' 'python<3.6' 'youtube-dl' 'qjson' 'pythonqt-qt5')
install=$pkgname.install
source=(https://github.com/rigon/$pkgname/archive/v$pkgver.tar.gz
        http://qmmp.ylsoftware.com/files/qmmp-$_qmmpver.tar.bz2)
md5sums=('3170539cb9bf5c07a999984d6ca8369f'
         'fd4900cd6a2c5330df452ce6adc4fb06')
backup=('usr/lib/qmmp/Transports/libhttp.so')


prepare() {
  # HTTP plugin patch
  cd "qmmp-$_qmmpver"/
  patch -p0 < ../"$pkgname-$pkgver"/http-fix.patch
}

build() {
  cd "$pkgname-$pkgver"/

  qmake
  make -j8
  
  # HTTP plugin build
  cd ../"qmmp-$_qmmpver"/
  cmake .
  make -j4 http
}

package() {
  mkdir -p "$pkgdir"/usr/lib/qmmp/General
  mkdir -p "$pkgdir"/usr/lib/qmmp/Transports

  cp "$pkgname-$pkgver"/libyoutube.so.1.0.0 "$pkgdir"/usr/lib/qmmp/General/libyoutube.so
  cp "qmmp-$_qmmpver"/src/plugins/Transports/http/libhttp.so "$pkgdir"/usr/lib/qmmp/Transports/libhttp-patched.so

}

