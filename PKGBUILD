# Maintainer: Douglas Browne <douglas.browne123@gmail.com>
pkgname=loudness-scanner-git
pkgver=v0.5.1.r18.g3d333bf
pkgrel=1
pkgdesc="EBU R128 loduness normalization tool"
arch=('any')
url="https://github.com/jiixyj/loudness-scanner"
license=('MIT')
depends=('libebur128' 'glib2' 'taglib')
makedepends=('cmake' 'git')
optdepends=('gstreamer: gstreamer input support'
            'libsndfile: libsndfile input support'
            'ffmpeg: ffmpeg input support'
            'libmpcdec: libmpcdec input support'
            'mpg123: libmpg123 input support')
provides=('loudness-scanner')
conflicts=('loudness-scanner')
source=("$pkgname::git+https://github.com/jiixyj/loudness-scanner.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git submodule deinit ebur128
  git submodule update
  sed -i '/add_subdirectory(ebur128\/ebur128)/d' ./CMakeLists.txt
}

build() {
  cd "$srcdir/$pkgname"
  cmake -DDISABLE_GTK2:BOOL=ON -DDISABLE_QT4:BOOL=ON .
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 loudness "${pkgdir}/usr/bin/loudness"
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
