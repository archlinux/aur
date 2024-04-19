# Maintainer: 
# Contributor: slact
pkgname=coreboot-utils
pkgver=24.02.01
pkgrel=1
pkgdesc="Tools and utilities to work with coreboot firmware"
url="https://www.coreboot.org/"
license=('GPL2')
arch=('x86_64')
depends=('glibc' 'pciutils' 'zlib')
optdepends=('python: me_cleaner support')
source=("https://coreboot.org/releases/coreboot-$pkgver.tar.xz"{,.sig})
sha256sums=('e56f5c0c9008bfdec1c4be6409ac093680140f9441efd3d5e47bdeffcbf77e50'
            'SKIP')

validpgpkeys=(
  '574CE6F6855CFDEB7D368E9D19796C2B3E4F7DF7' # Martin Roth (coreboot developer) <martin@coreboot.org>
  '1504DB83B93905F5160EB3FD86EB211649573F59' # Jason Glenesk (coreboot developer) <Jason.Glenesk@gmail.com>
  'C75AAA4E5C9DB017C1DC6EDBDB1B0EC29202D874' # Matt DeVillier <matt.devillier@gmail.com>
  '7642F206B20B77DAEB5B611A53C88CBFBC4F65F3' # Angel Pons <th3fanbus@gmail.com>
  'D0BB76A6FB81653A2B175BC2DB682C092C49D476' # Patrick Georgi <atrick@georgi.software>
  'EB51718A2D22AB1DA92C74B11F991B62CCC9259B' # Patrick Georgi <patrick@georgi.software>
  '3D705758E41EB17A3D28754941050E818DCB9057' # Patrick Georgi <pgeorgi@google.com>
)
provides=('ectool')
BUILD_AUTOPORT=y

if [ "$BUILD_AUTOPORT" == y ]; then
  makedepends=("${makedepends[@]}" go)
fi

prepare() {
  cd "coreboot-$pkgver"
  sed -i 's|CFLAGS  ?=|CFLAGS  +=|' util/intelmetool/Makefile
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
