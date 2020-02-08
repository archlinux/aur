# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=futurerestore
pkgname=$_name-git
pkgver=r182.88861b6
pkgrel=2
pkgdesc='iOS upgrade and downgrade tool utilizing SHSH blobs - git version'
arch=('x86_64')
url="https://github.com/tihmstar/$_name"
license=('LGPL3')
# require libimobiledevice-git since libimobiledevice/preboard.h added in 5086a97 is needed
depends=('libplist' 'libzip' 'libimobiledevice-git' 'libfragmentzip' 'libirecovery' 'curl' 'openssl' 'zlib' 'img4tool' 'libgeneral')
makedepends=('git')
provides=("$_name")
conflicts=("$_name")
source=("git+$url.git"
        'git+https://github.com/tihmstar/tsschecker.git'
        'git+https://github.com/tihmstar/idevicerestore.git'
        'git+https://github.com/tihmstar/jssy.git'
        "$_name-0001-Fix-incorrect-language-standard.patch"
        'tsschecker-0001-Fix-incorrect-language-standard.patch'
        'idevicerestore-0001-configure.ac-check-for-pthreads.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '18ff40ea773b1af3cf37fed3964e2f8d0a8badfb908c3e9697e920be08901883'
            '3fcde7558ae9f5ebfa930a2b02074251a6817e2a984c8d0e18113baa0ea708a5'
            '0e40eb0567a96a619fce0f2daf8bb4779a9753554ed7356bd04cf0ea15d18296')

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

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_name"

  make DESTDIR="$pkgdir/" install
}
