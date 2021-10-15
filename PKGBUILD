# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Co-Maintainer: Simon Krogmann <$(base64 --decode <<<'cy5rcm9nbWFubkB5YWhvby5jb20K')>
_org=pmem
pkgname=pmdk
pkgver=1.11.1
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
  'libpmem2'
  'libpmemobj'
  'libpmemblk'
  'libpmemlog'
  'libpmempool'
  'librpmem'
)
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_org/$pkgname/archive/$pkgver.tar.gz")
sha1sums=('e180377efa67f3db8c5fd322737e4f1f1cfb4eb9')

prepare() {

  # grep -nr -i -e 'ix/etc' -e 'ix)/etc'
  # grep -nr -Fe 'export sysconfdir'
  # src/pmdk-1.8/src/common.inc:220:export sysconfdir := $(prefix)/etc

  cd "$pkgname-$pkgver"
  sed -i 's#^export sysconfdir.*$#export sysconfdir := /etc#g' src/common.inc

}

build() {
  cd "$pkgname-$pkgver"
  # grep -nr -Fe '?='
  /bin/time -f '\n  %E\n' make LIB_PREFIX=lib prefix=/usr PREFIX=/usr
}

# https://github.com/pmem/pmdk#testing-libraries-on-linux-and-freebsd
# https://github.com/pmem/pmdk/blob/master/src/test/README
# check() {
#   cd "$pkgname-$pkgver/src/test" || return 1
#   make -k test
#   cp -v testconfig.sh.example testconfig.sh
#   ./RUNTESTS
# }

package() {

  cd "$pkgname-$pkgver"

  # pkgdir=/home/darren/.cache/yay/pmdk/pkg
  make LIB_PREFIX=lib prefix=/usr PREFIX=/usr DESTDIR="$pkgdir/" install

  # Fix 01
  # mv -v "$pkgdir/usr/lib64" "$pkgdir/usr/lib"

  # Fix 02
  # pacman -Qo /usr/share/bash-completion/completions/* | grep -v "owned by bash-completion"
  install -Dvm644 "$pkgdir/etc/bash_completion.d/pmempool" "$pkgdir/usr/share/bash-completion/completions/pmempool"
  rm    -v "$pkgdir/etc/bash_completion.d/pmempool"
  rmdir -v "$pkgdir/etc/bash_completion.d"
  rmdir -v "$pkgdir/etc"

  # Fix 03
  # pmdk E: Insecure RPATH '/usr/local/lib' in file ('usr/lib/libpmem<*>.so.1.0.0')
  # pmdk E: Insecure RPATH '/usr/local/lib/pmdk_debug' in file ('usr/lib/pmdk_debug/libpmem<*>.so.1.0.0')
  # pmdk W: Referenced library '<*>.so.1' is an uninstalled dependency
  # patchelf
  # chrpath

  install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
