# Maintainer: Douglas Browne <douglas.browne123@gmail.com>
pkgname=loudness-scanner-git
pkgver=v0.5.1.r45.gde149a1
pkgrel=1
pkgdesc="EBU R128 loudness normalization tool"
arch=('armv6h' 'armv7h' 'aarch64' 'x86_64')
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
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  cmake -DDISABLE_GTK2:BOOL=ON -DDISABLE_QT4:BOOL=ON -DDISABLE_QT5:BOOL=ON .
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 755 loudness "${pkgdir}/usr/bin/loudness"
  for i in libinput_*; do
  install -Dm 644 "$i" "${pkgdir}/usr/lib/$i"
  done
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
