# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=futurerestore
_forkname=$_name-s0uthwest
pkgname=$_forkname-git
pkgver=r248.08d0e00
pkgrel=6
pkgdesc="iOS upgrade and downgrade tool utilizing SHSH blobs - s0uthwest's fork - git version"
arch=('x86_64')
url="https://github.com/s0uthwest/$_name"
license=('LGPL3')
depends=('libplist' 'libzip' 'libimobiledevice' 'libfragmentzip' 'libirecovery' 'curl' 'openssl' 'zlib')
makedepends=('git' 'lzfse')
provides=("$_name" "$_forkname")
conflicts=("$_name")
source=("git+$url.git"
        'git+https://github.com/s0uthwest/img4tool-old.git'
        'git+https://github.com/tihmstar/tsschecker.git'
        'git+https://github.com/s0uthwest/idevicerestore.git'
        'git+https://github.com/tihmstar/jssy.git'
        'img4tool-0001-Include-arpa-inet.h-header.patch'
        'tsschecker-0001-Fix-incorrect-language-standard.patch'
        'idevicerestore-0001-configure.ac-check-for-pthreads.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'bd9c4dc74f56a26d9aef10938fe0fb58cdec268a80a04b217dd4a32c5b60db2d'
            '3fcde7558ae9f5ebfa930a2b02074251a6817e2a984c8d0e18113baa0ea708a5'
            '621e0e9bd2a31d8be8da59c051d2190a98be0f5c4cd5158225ffd4ff91d3ab1e')

pkgver() {
  cd "$_name"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_name"

  git submodule deinit -f --all
  git submodule init
  git config submodule.external/img4tool.url "$srcdir/img4tool-old"
  git config submodule.external/tsschecker.url "$srcdir/tsschecker"
  git config submodule.external/idevicerestore.url "$srcdir/idevicerestore"
  git submodule update

  cd external/img4tool
  for p in "$srcdir"/img4tool-*.patch; do
    patch -Np1 -i "$p"
  done
  cd ../..

  cd external/tsschecker
  git submodule init
  git config submodule.external/jssy.url "$srcdir/jssy"
  git submodule update
  for p in "$srcdir"/tsschecker-*.patch; do
    patch -Np1 -i "$p"
  done
  cd ../..

  cd external/idevicerestore
  for p in "$srcdir"/idevicerestore-*.patch; do
    patch -Np1 -i "$p"
  done
  cd ../..
}

build() {
  cd "$_name"

  CFLAGS+=' -DIDEVICERESTORE_NOMAIN=1 -DIMG4TOOL_NOMAIN=1 -DTSSCHECKER_NOMAIN=1'
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_name"

  make DESTDIR="$pkgdir/" install
}
