# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
pkgname=futurerestore-s0uthwest-git
_pkgname=futurerestore
pkgver=r231.546c759
pkgrel=1
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
        'check_for_pthreads.patch')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a9594bdc7fe465fe6e63cef1f9e6300fd79c37800431c718ebf37b4786f0ee3ecc76a61b9dd654200f2be059d87922baccddc475527c5b56491e99d9aa38f609')

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
  patch -Np1 -i "$srcdir/check_for_pthreads.patch"
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
