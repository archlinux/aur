# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=futurerestore
_fork=m1stadev
_forkpkgname=$_name-$_fork
_branch=test
_branchpkgname=$_forkpkgname-$_branch
pkgname=$_branchpkgname-git
pkgver=r265.d2a1e87f
pkgrel=1
pkgdesc="iOS upgrade and downgrade tool utilizing SHSH blobs - m1stadev's fork - test branch - git version"
arch=('x86_64')
url="https://github.com/$_fork/$_name"
license=('LGPL3')
# depend on libirecovery-git because idevicerestore requires unreleased libirecovery 1.0.1
depends=('curl' 'img4tool' 'libfragmentzip' 'libgeneral' 'libimobiledevice-glue' 'libimobiledevice' 'libirecovery-git' 'libplist' 'libzip' 'openssl' 'zlib')
makedepends=('git')
provides=("$_name" "$_forkpkgname" "$_branchpkgname")
conflicts=("$_name")
source=("git+$url.git#branch=$_branch"
        'git+https://github.com/m1stadev/idevicerestore.git'
        'git+https://github.com/1Conan/tsschecker.git'
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
  git config submodule.external/idevicerestore.url "$srcdir/idevicerestore"
  git config submodule.external/tsschecker.url "$srcdir/tsschecker"
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
