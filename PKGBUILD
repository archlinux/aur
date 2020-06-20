# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=futurerestore
pkgname=$_name-git
pkgver=r182.88861b6
pkgrel=3
pkgdesc='iOS upgrade and downgrade tool utilizing SHSH blobs - git version'
arch=('x86_64')
url="https://github.com/tihmstar/$_name"
license=('LGPL3')
depends=('libplist' 'libzip' 'libimobiledevice' 'libfragmentzip' 'libirecovery' 'curl' 'openssl' 'zlib' 'img4tool' 'libgeneral')
makedepends=('git')
provides=("$_name")
conflicts=("$_name")
source=("git+$url.git"
        'git+https://github.com/tihmstar/tsschecker.git'
        'git+https://github.com/tihmstar/idevicerestore.git'
        'git+https://github.com/tihmstar/jssy.git'
        "$_name-0001-Fix-incorrect-language-standard.patch"
        "$_name-0002-Update-libplist-and-libirecovery-names-for-2.2.0-1.0.patch"
        'tsschecker-0001-Fix-incorrect-language-standard.patch'
        'tsschecker-0002-Update-libplist-and-libirecovery-names-for-2.2.0-1.0.patch'
        'idevicerestore-0001-configure.ac-check-for-pthreads.patch'
        'idevicerestore-0002-Update-libirecovery-and-libplist-names-for-1.0.0-2.2.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '65a5830a7a3bbf7c7d0a8168eeadf5017b0b315abc821f6de41af6f300c426ff'
            '2dc476eece883053a4021113fd19da6f49fd59202f8c8395b101c4f4f090c77f'
            'f82391e9711521eb786c559cc44c989edd11682a81c48dd84e7519871d2f285a'
            '310b39992b2391e81458190f5299ad629d31152ffe2621221b5451ae32068614'
            'c800d9beaa459b7ff7b1bfa2f22731c56d29dbef457a0b6470bf24cd89a488cc'
            '312820af5af7989e2b3094ff7be8e7f009005a197b14b5517d33c60f78dbf74d')

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
