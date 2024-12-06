# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=klick
pkgname=$_pkgname-git
pkgver=0.14.2.r179.b3b277f
pkgrel=1
pkgdesc='An advanced command-line based metronome for JACK'
arch=(i686 x86_64)
url="http://das.nasophon.de/klick/"
license=(GPL-2.0-only)
depends=(glibc gcc-libs)
makedepends=(boost git jack liblo libsndfile rubberband scons)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/Allfifthstuning/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  local ver="$(grep ^version SConstruct | cut -f 2 -d "'" | sed -e 's/-/_/')"
  printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  scons PREFIX="/usr"
}

package() {
  depends+=(libjack.so liblo.so librubberband.so libsamplerate.so libsndfile.so)
  cd $_pkgname
  scons DESTDIR="${pkgdir}" install
  install -Dm644 doc/manual.html -t "$pkgdir"/usr/share/doc/$pkgname
}
