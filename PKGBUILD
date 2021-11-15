# Maintainer: push_sla <push2001sla@gmail.com>
# Contributor: WyvernTKC
pkgname=cpuminer-gr-avx2-git
_pkgname=cpuminer-gr-avx2
pkgver=1.2.4.1.r0.gd2e391d
pkgrel=1
pkgdesc="Optimised Version of GR miner for RTM - git version"
arch=('x86_64')
url="https://github.com/WyvernTKC/cpuminer-gr-avx2"
license=('GPL')
depends=('curl' 'jansson' 'gmp' 'openssl' 'zlib' 'numactl')
makedepends=('git' 'automake')
provides=('cpuminer' 'cpuminer-multi' 'cpuminer-opt' 'cpuminer-gr')
conflicts=('cpuminer' 'cpuminer-multi' 'cpuminer-opt')
source=('git+https://github.com/WyvernTKC/cpuminer-gr-avx2')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  cores=$(cat /proc/cpuinfo | grep processor | wc -l)

  ./autogen.sh

  CFLAGS="-O3 -march=native -mtune=native" CXXFLAGS="$CFLAGS -std=c++20 -Wno-ignored-attributes" ./configure --with-curl --prefix=/usr/

  make -j $cores
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
