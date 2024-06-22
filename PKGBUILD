# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Michael Laß <bevan@bi-co.net>
# Contributor: Marat "Morion" Talipov <morion.self@gmail.com>

pkgname=keepassx2-twofish
pkgver=2.0.3
pkgrel=5
pkgdesc="Cross Platform Password Manager (with unofficial patches for Twofish and unlock on auto-type)"
arch=('i686' 'x86_64')
url="https://www.keepassx.org/dev/"
license=('GPL-2.0-or-later')
depends=('qt4' 'glibc' 'libxi' 'libgcrypt' 'hicolor-icon-theme' 'libx11' 'libxtst' 'zlib' 'gcc-libs')
makedepends=('cmake')
conflicts=('keepassx' 'keepassx2-git' 'keepassx2')
options=(!emptydirs !debug)
source=("https://www.keepassx.org/releases/${pkgver}/keepassx-${pkgver}.tar.gz"
        https://github.com/drizzt/keepassx/commit/759c71ededf5c2c6447e2c79ad4f172ebb52e479.patch
        https://github.com/drizzt/keepassx/commit/75aac9901f9bcf8ce307abe8c26aeac18f7ce42c.patch
        https://github.com/drizzt/keepassx/commit/759347a803b2df45a2f70d46f718ee6fef072732.patch
        https://github.com/sevanteri/keepassx/commit/56eeacd573853881e10bec14616eb90a8796d840.patch
        https://github.com/sevanteri/keepassx/commit/c8f91c2ecff58359c254e07e3e49889db53f7d29.patch
        https://github.com/sevanteri/keepassx/commit/3f8aef259dd9f3b73e291ce9ee74182e7b7521a3.patch
        https://github.com/sevanteri/keepassx/commit/f242f40fcbe6ec886b7de0aab7ffde16e9b65cee.patch
        https://github.com/sevanteri/keepassx/commit/3b1d4015904c1c3abd3484784c026c411b528873.patch
        )
sha256sums=('23ffb4ae360c58aa139943442d175bc6b8f08e6a876ae76c4543ab983a6647c5'
            'b2c05f312211f1dee0d30add4fe1c7540b2815b1c20f2958c1cfcc91dc26ccf7'
            'b8640c7ee69fe3f6a3b2a9e18b99bf03207a876ac86ffecd252468edade95729'
            '4cdcae0e6e99a8bb40d99fdc8fab709f75a506438d088fc7be88054aca714b7a'
            '04636b53ac5bcacb89e4496f67f60e8fe869bbca02fbc4c0ddf641e9b39ff02c'
            '2e753e4c36f930aa624ad009f60937070f62a3457b55974c0d7ee63d07df565a'
            'b51d32d4a600be4d9f3b92c6fe9b62b57ec34662a1335f3550ffe2084ec67c01'
            '9b062f4182cb0edbc4c5df57eaf6d86e5d6bbc36f15255a4364ea32feb2b75fc'
            'e8212e4fb9a3c7037052fa0380b6a0103e752bc7b797ea1fe136d1adf52e7ab7')

_cmake_keys="-DCMAKE_INSTALL_PREFIX=/usr
             -DCMAKE_INSTALL_LIBDIR=/usr/lib
             -DCMAKE_BUILD_TYPE=Release"

prepare() {
  local x
  cd keepassx-${pkgver}

  for x in ${source[@]}; do
    [[ $x == *.patch ]] || continue
    patch -Np1 -i "$srcdir"/${x##*/}
  done
}

build() {
  cd keepassx-${pkgver}

  mkdir -p build
  cd build

  cmake $_cmake_keys ..
  make
}

package() {
  cd keepassx-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}
