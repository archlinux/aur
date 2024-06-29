# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=klick
pkgname=$_pkgname-git
pkgver=0.13.0_pre.r174.c050710
pkgrel=2
pkgdesc='An advanced command-line based metronome for JACK'
arch=(i686 x86_64)
url="http://das.nasophon.de/klick/"
license=(GPL-2.0-only)
depends=(glibc gcc-libs)
makedepends=(boost git jack liblo libsndfile rubberband scons)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/dsacre/klick.git"
        'klick-sconstruct-py3.patch')
sha256sums=('SKIP'
            '29d59dfb3cae6b8e0e77362391280ef32a18b3f7e33413921917ce465c5543e9')

pkgver() {
  cd $_pkgname
  local ver="$(grep ^version SConstruct | cut -f 2 -d "'" | sed -e 's/-/_/')"
  printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  patch -p1 -N -i "${srcdir}"/klick-sconstruct-py3.patch
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
