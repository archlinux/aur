# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
# Contributor: Romain Bazile <gromain.baz@gmail.com>
# Contributor: Bruno Rodriguez (brunorro)
# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig at har-ikkje dot net>
# Contributor: Travis Fickett <tfickett AT ufl DOT edu>
# Submitter: Anders Lund <anders at alweb dot dk>

pkgname=opencpn
pkgver=5.12.2
pkgrel=1
pkgdesc="Open Source Chart Plotting / Marine Navigation"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('wxwidgets-gtk3' 'portaudio' 'tinyxml' 'libsndfile' 'libarchive' 'libexif' 'glew' 'glu' 'webkit2gtk-4.1' 'wxsvg' 'rapidjson' 'sqlite')
optdepends=('gpsd: GPS position support')
makedepends=('cmake' 'lsb-release')
url="http://opencpn.org"
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenCPN/OpenCPN/archive/Release_${pkgver}.tar.gz" "plugin.patch" "shapelib.patch")
b2sums=('4c328383d697df20f26adada4df51ce0024a49c3b2bec95987a1faf1af8e32f051c9c08ff92f943d214d721ed572108f04fdfdf494fca5c0206634f3cdd6e71f' 'cde7210609eb215495ca4d0cae5323b96a533b1c6db3d44a72e255a79af1eed8156086f858edd795284217c16b66fca3bf2e813130b54add60029505a6871cc9' '957f2763875789ff75f6fe1d386005f992c45f9dce52a63cceeba26df1315e298025b0bab3e9ac680031e5112bfd92ade340a6228d4271f3758df4a3f936abe4')

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
