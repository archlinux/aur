# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: yubimusubi <possum plus aur at possum dot cc>

pkgname=3dstool
pkgver=1.2.6
pkgrel=4
pkgdesc="An all-in-one tool for extracting/creating 3ds roms"
arch=('x86_64')
url="https://github.com/dnasdw/$pkgname"
license=('MIT')
depends=('glibc' 'curl' 'openssl')
makedepends=('cmake' 'git')
source=(
  "$pkgname-$pkgver::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "$pkgname-paths.patch"
)
b2sums=('cd250c0c9d1c203c61e3696e75f0776b704ee9826eb3d0cc8cf337a8ddc5053de9a78b493511dbb688387c5ebb191d6991be43fa3603116f46b02a683e49d486'
  '226f75f5154d849aec1816064aa5d87db0e41c07d02edb85df5b2b397172a30b32603bccfdfa09a5431f9fbc12fcbbd9a5baccf6d82523d9253a430af0432108')

prepare() {
  patch -Np1 -i "../$pkgname-paths.patch" -d "$pkgname-$pkgver" || :
}

build() {
  cd "$pkgname-$pkgver"

  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE='Release'
    -D BUILD64=ON
    -D USE_DEP=OFF
    -D CMAKE_SKIP_RPATH=ON
    -D CMAKE_BUILD_WITH_INSTALL_RPATH=OFF
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cmake "${cmake_options[@]}"

  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "bin/Release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "bin/ignore_$pkgname.txt" -t "$pkgdir/usr/share/$pkgname"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
