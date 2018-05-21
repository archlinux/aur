# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libmediainfo-git
pkgver=18.05.r4.g4809c963
pkgrel=1
pkgdesc="Shared library for mediainfo"
arch=('i686' 'x86_64')
url="https://mediaarea.net/en/MediaInfo"
license=('BSD')
depends=('glibc' 'curl' 'libmms' 'libzen' 'zlib')
makedepends=('git')
provides=('libmediainfo')
conflicts=('libmediainfo')
source=("git+https://github.com/MediaArea/MediaInfoLib.git")
sha256sums=('SKIP')


pkgver() {
  cd "MediaInfoLib"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "MediaInfoLib/Project/GNU/Library"

  ./autogen.sh
  ./configure --prefix="/usr" \
    --with-libcurl \
    --with-libmms
  make
}

check() {
  cd "MediaInfoLib/Project/GNU/Library"

  #make check
}

package() {
  cd "MediaInfoLib"

  pushd "Project/GNU/Library"
  make DESTDIR="$pkgdir" install

  popd
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
