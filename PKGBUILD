# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
pkgname=futurerestore-s0uthwest-git
_pkgname=futurerestore
pkgver=r231.546c759
pkgrel=2
pkgdesc="iOS upgrade and downgrade tool utilizing SHSH blobs - s0uthwest's fork - git version"
arch=('x86_64')
url="https://github.com/s0uthwest/futurerestore"
license=('LGPL3')
depends=('libplist' 'libzip' 'libimobiledevice' 'libfragmentzip' 'libirecovery' 'libusbmuxd' 'curl' 'openssl' 'zlib' 'lzfse')
makedepends=('git')
provides=('futurerestore' 'futurerestore-s0uthwest')
conflicts=('futurerestore')
source=('git+https://github.com/s0uthwest/futurerestore.git'
        'git+https://github.com/s0uthwest/img4tool.git'
        'git+https://github.com/s0uthwest/tsschecker.git'
        'git+https://github.com/s0uthwest/idevicerestore.git'
        'git+https://github.com/tihmstar/jssy.git'
        'idevicerestore-0001-configure.ac-check-for-pthreads.patch'
        'idevicerestore-0002-Revert-img4-fix-ubuntu-compiling.patch')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '99635fba451f1bfa0864cb4b2ccee76c49413c66ec08a975cdb4432d564cbc4824be96999fe5adbec9cf90b41f5ba00e71fd45088e173e66af75d5722ad7e587'
            'f840c0897da1b11e5f43b09d784b57757f8de68edf021f5a9230ccbf392acabe1b1e574a4156d7cef86976c3f38ca04b9ad2d52f72c08c94e4105720780edd0d')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  git submodule deinit -f --all
  git submodule init
  git config submodule.external/img4tool.url "$srcdir/img4tool"
  git config submodule.external/tsschecker.url "$srcdir/tsschecker"
  git config submodule.external/idevicerestore.url "$srcdir/idevicerestore"
  git submodule update

  cd external/idevicerestore
  for p in "$srcdir"/idevicerestore-*.patch; do
    patch -Np1 -i "$p"
  done
  cd ../..

  cd external/tsschecker
  git submodule init
  git config submodule.external/jssy.url "$srcdir/jssy"
  git submodule update
  cd ../..
}

build() {
  cd "$_pkgname"

  CFLAGS+=' -DIDEVICERESTORE_NOMAIN=1 -DIMG4TOOL_NOMAIN=1 -DTSSCHECKER_NOMAIN=1'
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
