# Maintainer: Jianqiu Zhang <void001@archlinuxcn.org>

pkgname=brpc-git
pkgver=1.0.0.rc01.r32.gfd38def9
pkgrel=1
pkgdesc="Apache brpc is an industrial-grade RPC framework for building reliable and high-performance services."
arch=('i686' 'x86_64')
url="https://brpc.apache.org/"
license=(Apache)
groups=()
depends=(gflags leveldb google-glog openssl protobuf)
makedepends=(git cmake gcc)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=(
  ${pkgname}::git+https://github.com/apache/incubator-brpc
  always_use_dynamic_link.patch
)
sha256sums=('SKIP'
            'edcfd99c3454ccfa0a7c16efdcac2a123aa14b0f52cf1de022379662c23aced4')

pkgver()
{
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    echo "Prepare"
    cp always_use_dynamic_link.patch "$srcdir/$pkgname"
    cd "$srcdir/$pkgname"
    git apply always_use_dynamic_link.patch
}

build() {
  cd "$srcdir/$pkgname"
  sh ./config_brpc.sh --libs=/usr/lib --headers=/usr/include --with-glog
  make -j$(nproc --ignore 4)
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/include/
  mkdir -p $pkgdir/usr/lib/
  install -Dm655 output/lib/libbrpc.so $pkgdir/usr/lib/
  install -Dm644 output/lib/libbrpc.a $pkgdir/usr/lib/
  ls -al "$pkgdir"
  cp -r output/include/* $pkgdir/usr/include/
}

# vim:set ts=2 sw=2 et:

