# Maintainer: slava.ganzin <slava.ganzin@gmail.com>
pkgname=deepdetect-git
pkgver=r544.c8556f0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Open Source + Deep Learning + API + Server"
url="http://www.deepdetect.com/"
license=('GPL')
depends=(
'eigen'
'google-glog'
'gflags'
'opencv'
'cpp-netlib'
'boost'
'curl'
'libcurlpp'
'utf8cpp'
'openblas-lapack'
'protobuf'
'hdf5'
'leveldb'
'snappy'
'lmdb'
'python'
)
makedepends=('git' 'gcc' 'make' 'cmake')
optdepends=('cuda: GPL processing')
provides=()
source=("$pkgname::git+https://github.com/beniz/deepdetect.git")
md5sums=('SKIP')
install=$pkgname.install


pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  sed -i s/find.*Eigen.*// $pkgname/CMakeLists.txt
  mkdir $srcdir/$pkgname/build
  cd $srcdir/$pkgname/build
  cmake .. -DEIGEN3_INCLUDE_DIR=/usr/include/eigen3
  make
  # -j $((`nproc` -1))
  for f in `find $srcdir -name "*.py"`; do
    sed -i s/env\ python$/env\ python2/ $f;
  done
}

package() {
  mkdir  $pkgdir/usr/{lib,share,bin}/$pkgname -p
  install -Dm755 $srcdir/$pkgname/build/main/dede $pkgdir/usr/bin/dede
  install -Dm755 $srcdir/$pkgname/build/caffe_dd/src/caffe_dd/build/lib/* $pkgdir/usr/lib
  cp -r  $srcdir/$pkgname $pkgdir/usr/share
}
