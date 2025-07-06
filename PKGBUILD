# Maintainer: Christopher Snowhill <kode54@gmail.com>
pkgname=fooyin-kode54-plugins-git
_pkgname=${pkgname%-git}
pkgver=r20.576e594
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
         'libbasswv' 'libmgba' 'vgmstream')
source=('git+https://github.com/kode54/fooyin-kode54-plugins.git'
        'git+https://github.com/kode54/midi_processing.git'
        'git+https://bitbucket.org/losnoco/psflib.git'
        'git+https://bitbucket.org/losnoco/highly_experimental.git'
        'git+https://bitbucket.org/losnoco/highly_theoretical.git'
        'git+https://bitbucket.org/losnoco/highly_quixotic.git'
        'git+https://bitbucket.org/losnoco/vio2sf.git'
        'git+https://bitbucket.org/losnoco/lazyusf2.git'
        'git+https://bitbucket.org/losnoco/sseqplayer.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.subprojects/midi_processing.url "$srcdir/midi_processing"
  git config submodule.subprojects/psflib.url "$srcdir/psflib"
  git config submodule.subprojetcs/highly_experimental.url "$srcdir/highly_experimental"
  git config submodule.subprojects/highly_theoretical.url "$srcdir/highly_theoretical"
  git config submodule.subprojects/highly_quixotic.url "$srcdir/highly_quixotic"
  git config submodule.subprojects/vio2sf.url "$srcdir/vio2sf"
  git config submodule.subprojects/lazyusf2.url "$srcdir/lazyusf2"
  git config submodule.subprojects/sseqplayer.url "$srcdir/sseqplayer"
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
