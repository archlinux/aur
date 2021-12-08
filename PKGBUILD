# Maintainer: Luis Batalha <lfrb25 at gmail dot com>

commit_hash=03c7ab14d4e9396821bd79898dcb0439447d3245
source_dir='qoi'

pkgname=(qoi-headers-git
         qoiconv-git
         qoibench-git
        )
pkgbase=qoi-git
pkgver=r42.03c7ab1
pkgrel=1
pkgdesc="The 'Quite OK Image' format for fast, lossless image compression"
arch=('x86_64')
url='https://phoboslab.org/log/2021/11/qoi-fast-lossless-image-compression'
license=('MIT')
source=("$source_dir::git+https://github.com/phoboslab/qoi.git#commit=$commit_hash")
makedepends=('git'
             'gcc-libs'
             'stb'
             )
sha256sums=('SKIP')

pkgver() {
  cd $source_dir
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $source_dir
  sed -i 's/"stb_image.h"/<stb\/stb_image.h>/g' qoiconv.c qoibench.c
  sed -i 's/"stb_image_write.h"/<stb\/stb_image_write.h>/g' qoiconv.c qoibench.c
}

build() {
  cd $source_dir
  gcc -std=gnu99 -lpng $CFLAGS -o qoibench qoibench.c
  gcc -std=c99 $CFLAGS -o qoiconv qoiconv.c
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
  pkgdesc+=" - Benchmark qoi against various png libraries" 
  depends=('libpng')
  install -Dm755 $source_dir/qoibench "$pkgdir"/usr/bin/qoibench
}
