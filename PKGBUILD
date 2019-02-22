# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
pkgname=futurerestore-s0uthwest-git
_pkgname=futurerestore
pkgver=r230.8e00751
pkgrel=4
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
        'idevicerestore-0001-configure.ac-check-for-pthreads.patch')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'eb412d9b814a8d94e6f716e82559f5d5e31b5ca5267b8e28c47d72d09312ea138f448785a3f39e8798d2cd15b9f65168fda39a21ea465274d32b3b24a979ed91')

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
