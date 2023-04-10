# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libsamplerate-git
pkgver=0.2.2.r12.g215c75e
pkgrel=1
pkgdesc="A Sample Rate Converter for audio"
arch=('i686' 'x86_64')
url="https://libsndfile.github.io/libsamplerate/"
license=('BSD')
depends=('glibc' 'libsndfile')
makedepends=('git')
checkdepends=('fftw')
provides=("libsamplerate=$pkgver")
conflicts=('libsamplerate')
options=('staticlibs')
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

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libsamplerate"

  make check
}

package() {
  cd "libsamplerate"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/libsamplerate"
}
