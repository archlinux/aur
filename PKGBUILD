# Maintainer: Jakob (XDjackieXD) <aur at chaosfield dot at>

pkgname=gr-satnogs-git
pkgver=r726.30ecab7
pkgrel=1
pkgdesc="gr-satnogs from librespacefoundation"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/librespacefoundation/satnogs/gr-satnogs.git"
license=('GPL3')
depends=('gnuradio' 'png++' 'nlohmann-json' 'libvorbis' 'libogg' 'libvolk' 'libpng' 'itpp' 'hamlib')
makedepends=('git' 'cmake' 'swig')
provides=('gr-satnogs')
conflicts=('gr-satnogs')
source=("git+$url" "git+https://github.com/d-bahr/CRCpp.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gr-satnogs

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd gr-satnogs
  git submodule init
  git config submodule.CRCpp.url "$srcdir/CRCpp"
  git -c protocol.file.allow=always submodule update
}

build() {
  mkdir -p gr-satnogs/build
  cd gr-satnogs/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd gr-satnogs/build

  make DESTDIR="$pkgdir" install
}

