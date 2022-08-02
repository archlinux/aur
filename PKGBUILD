# Contributor: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=futurerestore
_fork=m1stadev
_forkpkgname=$_name-${_fork,,}
pkgname=$_forkpkgname-git
pkgver=r278.ecc32003
pkgrel=1
pkgdesc="iOS upgrade and downgrade tool utilizing SHSH blobs - m1stadev's fork - git version"
arch=('x86_64')
url="https://github.com/futurerestore/$_name"
license=('LGPL3')
# depend on libirecovery-git because idevicerestore requires unreleased libirecovery 1.0.1
# depend on libplist-git because idevicerestore requires unreleased libplist 70f4a422e01910cdb783aac81f13c11223c3acbd
depends=('curl' 'img4tool' 'libfragmentzip' 'libgeneral' 'libimobiledevice-glue' 'libimobiledevice' 'libirecovery-git' 'libplist-git' 'libzip' 'openssl' 'zlib')
makedepends=('git')
provides=("$_name" "$_forkpkgname" 'futurerestore-marijuanarm-git')
conflicts=("$_name")
replaces=('futurerestore-marijuanarm-git')
# use last commit with old build system
# TODO update for new build system
#source=("git+$url.git"
source=("git+$url.git#commit=ecc32003b09a3afb27be80fd881cee9fcc0b5d49"
        'git+https://github.com/futurerestore/idevicerestore.git'
        'git+https://github.com/1Conan/tsschecker.git'
        'git+https://github.com/tihmstar/jssy.git'
        'idevicerestore-0001-configure.ac-check-for-pthreads.patch'
        'idevicerestore-0002-ipsw-Update-to-reflect-color-macro-name-change-in-li.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '3ba642f08b569bd91767a1c3bd74cc4dcf50f14c7253c4a5f20795acaafcf8f1'
            '7f01f292913d20df47254a776bab3cab385063d86b47420706bae42450e8b8f3')

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
