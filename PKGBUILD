# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=futurerestore
_fork=m1stadev
_forkpkgname=$_name-${_fork,,}
pkgname=$_forkpkgname-git
pkgver=r199.f42719c5
pkgrel=1
pkgdesc="iOS upgrade and downgrade tool utilizing SHSH blobs - m1stadev's fork - git version"
arch=('x86_64')
url="https://github.com/$_fork/$_name"
license=('LGPL3')
depends=('curl' 'img4tool' 'libfragmentzip' 'libgeneral' 'libimobiledevice' 'libirecovery' 'libplist' 'libzip' 'openssl' 'zlib')
makedepends=('git')
provides=("$_name" "$_forkpkgname" 'futurerestore-marijuanarm-git')
conflicts=("$_name")
replaces=('futurerestore-marijuanarm-git')
source=("git+$url.git"
        'git+https://github.com/DanTheMann15/tsschecker.git'
        'git+https://github.com/m1stadev/idevicerestore.git'
        'git+https://github.com/tihmstar/jssy.git'
        'idevicerestore-0001-configure.ac-check-for-pthreads.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '7a1ac46309eab59763186fdb91e456bd77f703b0fe59fec968e0001349c24d78')

pkgver() {
  cd "$_name"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_name"

  git submodule deinit -f --all
  git submodule init
  git config submodule.external/tsschecker.url "$srcdir/tsschecker"
  git config submodule.external/idevicerestore.url "$srcdir/idevicerestore"
  git submodule update

  cd external/tsschecker
  git submodule init
  git config submodule.external/jssy.url "$srcdir/jssy"
  git submodule update
  cd ../..

  cd external/idevicerestore
  for p in "$srcdir"/idevicerestore-*.patch; do
    patch -Np1 -i "$p"
  done
  cd ../..
}

build() {
  cd "$_name"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_name"

  make DESTDIR="$pkgdir/" install
}
