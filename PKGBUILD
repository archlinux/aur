# Maintainer: Christopher Snowhill <kode54@gmail.com>
pkgname=fooyin-kode54-plugins-git
_pkgname=${pkgname%-git}
pkgver=r9.f629abb
pkgrel=1
pkgdesc="A set of plugins for Fooyin (Git version)"
url="https://github.com/kode54/fooyin-kode54-plugins"
arch=('x86_64')
license=('GPL3'
         'LGPL2.1'
         'ZLIB'
         'proprietary')
makedepends=('cmake' 'git')
depends=('fooyin' 'libbass' 'libbassmidi' 'libbass_mpc' 'libbassflac' 'libbassopus'
         'libbasswv')
source=('git+https://github.com/kode54/fooyin-kode54-plugins.git'
        'git+https://github.com/kode54/midi_processing.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.subprojects/midi_processing.url "$srcdir/midi_processing"
  git -c protocol.file.allow=always submodule update
}

build() {
  local cmake_options=(
    -B build
    -S $_pkgname
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
