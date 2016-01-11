# Maintainer: Kyle <kyle@gmx.ca>
pkgname=espeak-ng-git
_gitname=espeak-ng
pkgver=0.0 # determined from git origin
pkgrel=1
pkgdesc="Next generation open source speech synthesizer based on Espeak (git version)"
arch=(i686 x86_64)
url="https://github.com/espeak-ng/espeak-ng"
license=('GPL3')
depends=(gcc-libs)
optdepends=('portaudio: speech output via Portaudio'
  'pulseaudio: speech output via Pulseaudio')
makedepends=('git')
provides=(espeak)
conflicts=(espeak espeak-test)
source=('git+https://github.com/espeak-ng/espeak-ng.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed -e 's|v||' -e 's|-|.|g'
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr/bin
  cd ../lib
    for f in libespeak-ng.so*; do
    ln -s "$f" $(echo $f|sed 's|-ng||')
  done
}

# vim:set ts=2 sw=2 et:
