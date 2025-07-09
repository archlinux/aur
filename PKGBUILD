# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsamplerate-git
pkgver=0.2.2.r18.g15c392d
pkgrel=1
pkgdesc="A Sample Rate Converter for audio"
arch=('i686' 'x86_64')
url="https://libsndfile.github.io/libsamplerate/"
license=('BSD-2-Clause')
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
  cmake --build "_build"
}

check() {
  cd "libsamplerate"

  #cmake --build "_build" --target test
}

package() {
  cd "libsamplerate"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 {AUTHORS,NEWS,README.md,ChangeLog} -t "$pkgdir/usr/share/doc/libsamplerate"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libsamplerate"
}
