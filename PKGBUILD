# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-climatology
pkgver=1.4.46.0
pkgrel=1
pkgdesc="Climatology plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/climatology.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/climatology_pi/archive/refs/tags/v$pkgver.tar.gz" "gl.patch")
b2sums=('79bdc314fb0b8179dd2884ac94b1c32346887358683a462ddd0fa28e231f709c432b07313bc5dd786e874bb76b1726d7f8ed496bd582e3a538aae38c98fbcccd' '9b12e9a5701a0d074265d15d50350db4d2526f1bfa7baec0b78b4f38fdd9b1e5bc77199ad337599aa28a7fa8a253246d8c764a2b3fbc2f47fc595fdb23f59306')


prepare(){
  cd climatology_pi-$pkgver
  git submodule update --init
  patch --strip=1 --input=../gl.patch
}
          
build() {
  cd climatology_pi-$pkgver
  mkdir -p build
  cd build
  #Force GTK3, suppress cmake warnings, allow C++11
  BUILD_GTK3=TRUE cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPlugin_CXX11=ON ..
  make
}

package() {
  cd climatology_pi-$pkgver/build
  DESTDIR="$pkgdir" make install
}
