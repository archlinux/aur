# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=futurerestore
_fork=marijuanARM
_forkpkgname=$_name-${_fork,,}
_branch=a13/a14
_branchpkgname=$_forkpkgname-${_branch//\//-}
pkgname=$_branchpkgname-git
pkgver=r189.c6e09fb
pkgrel=1
pkgdesc="iOS upgrade and downgrade tool utilizing SHSH blobs - marijuanARM's fork (for A13 and above only) - git version"
arch=('x86_64')
url="https://github.com/$_fork/$_name"
license=('LGPL3')
depends=('libplist' 'libzip' 'libimobiledevice' 'libfragmentzip' 'libirecovery' 'curl' 'openssl' 'zlib' 'img4tool' 'libgeneral')
makedepends=('git')
provides=("$_name" "$_branchpkgname")
conflicts=("$_name")
source=("git+$url.git#branch=$_branch"
        'git+https://github.com/tihmstar/tsschecker.git'
        'git+https://github.com/marijuanARM/idevicerestore.git'
        'git+https://github.com/tihmstar/jssy.git'
        "$_name-0001-Ensure-CUSTOM_LOGGING-refers-to-a-file.patch"
        'idevicerestore-0001-configure.ac-check-for-pthreads.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6b50f455cfa5a60fcb77d9db55ce48186774b5cf9c5f04ad5fc911b8df7e047e'
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

  for p in "$srcdir"/$_name-*.patch; do
    patch -Np1 -i "$p"
  done

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
