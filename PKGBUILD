# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
pkgname=futurerestore-s0uthwest-git
_pkgname=futurerestore
pkgver=r230.b6f1b1b
pkgrel=3
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
        'idevicerestore-0002-Revert-img4-fix-compiling-for-linux.patch')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'eb412d9b814a8d94e6f716e82559f5d5e31b5ca5267b8e28c47d72d09312ea138f448785a3f39e8798d2cd15b9f65168fda39a21ea465274d32b3b24a979ed91'
            '5c77470c161488c88d42401da6048007b2186081e12628e83a943e15bccdff43a4e92bb55e0e3b85ee35ed157544eea7c9d99f25203e62ceaf3171e92c9ff54a')

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
