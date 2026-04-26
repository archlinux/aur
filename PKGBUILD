# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
# Contributor: Romain Bazile <gromain.baz@gmail.com>
# Contributor: Bruno Rodriguez (brunorro)
# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Contributor: Travis Fickett <tfickett AT ufl DOT edu>
# Submitter: Anders Lund <anders at alweb dot dk>

pkgname=opencpn
pkgver=5.14.0
pkgrel=1
pkgdesc="Open Source Chart Plotting / Marine Navigation"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('wxwidgets-gtk3' 'portaudio' 'tinyxml' 'libsndfile' 'libarchive' 'libexif' 'glew' 'glu' 'webkit2gtk-4.1' 'wxsvg' 'rapidjson' 'shapelib' 'sqlite')
optdepends=('gpsd: GPS position support')
makedepends=('cmake' 'lsb-release')
url="http://opencpn.org"
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenCPN/OpenCPN/archive/Release_${pkgver}.tar.gz" "plugin.patch" "shapelib.patch")
b2sums=('9089e14f5f4fe1e33117884c455eaaf159ddbe2f6e2ccd4b873401a66b9c9ecc721384eff5ae8b3498f6c6f58eda7840bdccaab38c33f64000fc01b793e9f6a0' 'e5195a4f8156f177d3810aa13cb4a956d635a230f743d523c78d2a160fed3ec2b83d21b52640ae29ebf4bcfc34829fc3bc6a04105cb59834e20d7a0a106f16b2' '957f2763875789ff75f6fe1d386005f992c45f9dce52a63cceeba26df1315e298025b0bab3e9ac680031e5112bfd92ade340a6228d4271f3758df4a3f936abe4')

prepare() {
  cd OpenCPN-Release_${pkgver}
  patch --strip=1 --input=../plugin.patch
  patch --strip=1 --input=../shapelib.patch
}


build() {
  cd OpenCPN-Release_${pkgver}
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DOCPN_BUILD_TEST=OFF -DOCPN_VERBOSE=OFF -DOCPN_USE_EXTERN_CURL=ON ..
  make
}

package() {
  cd OpenCPN-Release_${pkgver}/build
  make DESTDIR="$pkgdir" install
  cd "$pkgdir"
  rm -rf usr/include/
  rm -rf usr/lib/pkgconfig/
  rm -rf usr/share/shapelib/
  rm usr/lib/libshp.a
}
