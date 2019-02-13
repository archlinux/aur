# Maintainer: Milk Brewster <milk on freenode>
_pkgname=samplecat
pkgname=${_pkgname}-git
pkgver=r529.5fdca5a
pkgrel=1
pkgdesc="A program for cataloguing and auditioning audio samples."
arch=(x86_64)
url="http://ayyi.github.io/samplecat"
license=('GPL')
groups=()
depends=('dbus' 'jack' 'libsndfile' 'sqlite' 'ffmpeg' 'gtk2' 'sdl' 'libass' 'gtkglext' 'fftw' 'ladspa' 'python')
makedepends=('git')
provides=('samplecat' 'samplecat-git')
conflicts=('samplecat' 'samplecat-git')
install=
source=('git+https://github.com/ayyi/samplecat')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/samplecat"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/samplecat"
  git submodule update --init 
  git submodule foreach git pull origin master
  ./autogen.sh
  ./configure
}

build() {
  cd "$srcdir/samplecat"
  make
}

package() {
  cd "$srcdir/samplecat"
  mkdir -p $pkgdir/usr/bin
  cp src/samplecat $pkgdir/usr/bin
  # make PREFIX=/usr DESTDIR="$pkgdir/" install
}
