# Maintainer: Luis Batalha <lfrb25 at gmail dot com>

commit_hash=09d144f89264342901250d280b5a7905748fa66f
source_dir='qoi'

pkgname=(qoi-headers-git
         qoiconv-git
         qoibench-git
        )
pkgbase=qoi-git
pkgver=r192.09d144f
pkgrel=2
pkgdesc="The 'Quite OK Image' format for fast, lossless image compression"
arch=('x86_64')
url='https://qoiformat.org/'
license=('MIT')
source=("$source_dir::git+https://github.com/phoboslab/qoi.git#commit=$commit_hash")
makedepends=('git'
             'gcc-libs'
             'stb'
             'libpng'
             )
sha256sums=('SKIP')

pkgver() {
  cd $source_dir
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $source_dir
  gcc -std=gnu99 -lpng -I /usr/include/stb/ $CFLAGS -o qoibench qoibench.c
  gcc -std=c99 $CFLAGS -I /usr/include/stb/ -o qoiconv qoiconv.c
}

package_qoi-headers-git() {
  provides=('qoi-headers')
  pkgdesc+=" - headers"
  install -Dm644 $source_dir/qoi.h $pkgdir/usr/include/qoi.h
}
package_qoiconv-git() {
  provides=('qoiconv')
  pkgdesc+=" - PNG<>QOI conversion utility" 
  install -Dm755 $source_dir/qoiconv "$pkgdir"/usr/bin/qoiconv
}

package_qoibench-git() {
  provides=('qoibench')
  depends=('libpng')
  pkgdesc+=" - Benchmark qoi against various png libraries" 
  install -Dm755 $source_dir/qoibench "$pkgdir"/usr/bin/qoibench
}
