# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=futurerestore
pkgname=$_name-git
pkgver=r180.38b1680
pkgrel=1
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
        "$_name-0001-Exclude-subdirs-from-install.patch"
        "$_name-0002-Fix-incorrect-language-standard.patch"
        "$_name-0003-Don-t-overwrite-CFLAGS.patch"
        'tsschecker-0001-Fix-incorrect-language-standard.patch'
        'idevicerestore-0001-configure.ac-check-for-pthreads.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '173e2299818e9a29183dc805301960ccd07f7fde1abc5ffa6f4cf82d365f5ae9'
            '068a9581b71ba6625062d2eb13ad716dfe865bfa057692f4b62f7963f659e34c'
            '79de9311acdf8a382293b499a671bbd7a434266d33f78227bfab645afe2b4c03'
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
