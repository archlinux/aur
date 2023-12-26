# Maintainer: 
# Contributor: slact
pkgname=coreboot-utils
pkgver=4.22.01
pkgrel=1
pkgdesc="Tools and utilities to work with coreboot firmware"
url="https://www.coreboot.org/"
license=('GPL2')
arch=('x86_64')
depends=('glibc' 'pciutils' 'zlib')
optdepends=('python: me_cleaner support')
source=("https://coreboot.org/releases/coreboot-$pkgver.tar.xz"{,.sig} ifdtools-nowerror.patch)
sha256sums=('3d1a36dfb2a654133c7f36cf4da436f0d79f535644069adfe7cdcad962532c3f'
            'SKIP'
	    'SKIP')
validpgpkeys=('574CE6F6855CFDEB7D368E9D19796C2B3E4F7DF7') # Martin Roth (coreboot developer) <martin@coreboot.org>

provides=('ectool')
BUILD_AUTOPORT=y

if [ "$BUILD_AUTOPORT" == y ]; then
  makedepends=("${makedepends[@]}" go)
fi

prepare() {
  cd "coreboot-$pkgver"
  patch -p0 < ../ifdtools-nowerror.patch
}

build() {
  cd "coreboot-$pkgver/src"

  for tool in amdfwtool cbfstool cbmem ectool ifdtool intelmetool inteltool intelvbttool nvramtool superiotool; do
    case $tool in
      "intelmetool")
	make -C "../util/${tool}"
#	make -C "../util/${tool}" "${tool}"
	;;
      *)
	make -C "../util/${tool}"
	;;
     esac
  done

  if [ "$BUILD_AUTOPORT" == y ]; then
    cd ../util/autoport
    go build
  fi
}

package() {
  cd "coreboot-$pkgver"

  for tool in cbfstool cbmem ectool ifdtool intelmetool inteltool intelvbttool \
    nvramtool superiotool; do
    install -Dm755 "util/${tool}/${tool}" -t "$pkgdir/usr/bin/"
  done

  install -m755 util/cbfstool/rmodtool -t "$pkgdir/usr/bin/"
  install -m755 util/me_cleaner/me_cleaner.py "$pkgdir/usr/bin/me_cleaner"

  if [ "$BUILD_AUTOPORT" == y ]; then
    install -m755 util/autoport/autoport -t "$pkgdir/usr/bin/"
  fi

  install -Dm644 util/inteltool/inteltool.8 -t "$pkgdir/usr/share/man/man8/"
  install -m644 util/nvramtool/cli/nvramtool.8 -t "$pkgdir/usr/share/man/man8/"
  install -m644 util/superiotool/superiotool.8 -t "$pkgdir/usr/share/man/man8/"
  install -Dm644 util/me_cleaner/man/me_cleaner.1 -t "$pkgdir/usr/share/man/man1/"
}
