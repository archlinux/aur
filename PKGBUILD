# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsamplerate-git
pkgver=0.2.2.r13.g22bd06e
pkgrel=1
pkgdesc="A Sample Rate Converter for audio"
arch=('i686' 'x86_64')
url="https://libsndfile.github.io/libsamplerate/"
license=('BSD')
depends=('glibc')
makedepends=('git' 'alsa-lib' 'cmake' 'libsndfile' 'opus')
checkdepends=('fftw')
provides=("libsamplerate=$pkgver" 'libsamplerate.so')
conflicts=('libsamplerate')
source=("git+https://github.com/erikd/libsamplerate.git")
sha256sums=('SKIP')


pkgver() {
  cd "libsamplerate"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libsamplerate"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    ./
  make -C "_build"
}

check() {
  cd "libsamplerate"

  make -C "_build" test
}

package() {
  cd "libsamplerate"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 {AUTHORS,NEWS,README.md,ChangeLog} -t "$pkgdir/usr/share/doc/libsamplerate"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libsamplerate"
}
