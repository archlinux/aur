# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=futurerestore
_forkname=$_name-s0uthwest
pkgname=$_forkname-git
pkgver=r248.08d0e00
pkgrel=7
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
        "$_name-0001-Update-libplist-and-libirecovery-names-for-2.2.0-1.0.patch"
        'img4tool-0001-Include-arpa-inet.h-header.patch'
        'tsschecker-0001-Fix-incorrect-language-standard.patch'
        'tsschecker-0002-Update-libplist-and-libirecovery-names-for-2.2.0-1.0.patch'
        'idevicerestore-0001-configure.ac-check-for-pthreads.patch'
        'idevicerestore-0002-Update-libirecovery-libplist-and-libusbmuxd-names-fo.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8fb94f7c55ffda3e0cae69ff66dbc833e95adcf2dd7fa046012801539539bcde'
            'bd9c4dc74f56a26d9aef10938fe0fb58cdec268a80a04b217dd4a32c5b60db2d'
            'cc9efff8b41be914b36955d15adca72447ea0ec68ec6fb4bec43bc0d67ca400c'
            'f85de30d45d2390e99d08932c4483632854947f18b8681013e9cd7729033a775'
            '366065b2c1d80b6a22a0a3560e51bf30372311d390771ff105b1cf5b53fb7da0'
            '95a44eef2daa9b996b027006e3f7b06eb0e47a51c40ff9fbb0271324c132a97d')

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

  for p in "$srcdir"/$_name-*.patch; do
    patch -Np1 -i "$p"
  done

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
