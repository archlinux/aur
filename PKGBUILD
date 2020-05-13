# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
_org=pmem
pkgname=pmdk
pkgver=1.8
pkgrel=1
pkgdesc="Persistent Memory Development Kit"
arch=('x86_64')
url="https://pmem.io/"
license=('BSD')
depends=(
  'ndctl>=63' # 'daxctl' included
)
makedepends=(
  'pandoc'
)
# checkdepends=()
optdepends=(
  'libfabric>=1.4.2: required by librpmem'
)
provides=(
  'libpmem'
  'libpmemobj'
  'libpmemblk'
  'libpmemlog'
  'libpmempool'
  'librpmem'
)
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_org/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('ec8941117077bd5b9e766585e5223734dbd0329e')

prepare() {
  # return 1
  cd "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  make -j$(nproc)
}

check() {

  return 0

  cd "$pkgname-$pkgver/src/test" || return 1
  # make -k test
  make test
  cp -v testconfig.sh.example testconfig.sh
  ./RUNTESTS

}

package() {

  cd "$pkgname-$pkgver"
  make prefix="/usr" DESTDIR="$pkgdir/" install

  # Fix 01
  mv -v "$pkgdir/usr/lib64" "$pkgdir/usr/lib"

  # Fix 02
  # pacman -Qo /usr/share/bash-completion/completions/* | grep -v "owned by bash-completion"
  install -Dvm644 "$pkgdir/usr/etc/bash_completion.d/pmempool" "$pkgdir/usr/share/bash-completion/completions/pmempool"
  rm -rv "$pkgdir/usr/etc"

  # Fix 03
  # pmdk E: Insecure RPATH '/usr/local/lib' in file ('usr/lib/libpmem<*>.so.1.0.0')
  # pmdk E: Insecure RPATH '/usr/local/lib/pmdk_debug' in file ('usr/lib/pmdk_debug/libpmem<*>.so.1.0.0')
  # pmdk W: Referenced library '<*>.so.1' is an uninstalled dependency
  # patchelf
  # chrpath

  install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
