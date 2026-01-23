# Maintainer: LinuxLover471 <linuxlover471 at proton dot me>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: yubimusubi <possum plus aur at possum dot cc>

pkgname=3dstool
pkgver=1.2.6
pkgrel=2
pkgdesc="An all-in-one tool for extracting/creating 3ds roms"
arch=('x86_64')
url="https://github.com/dnasdw/${pkgname}"
license=('MIT')
depends=('glibc' 'curl' 'openssl')
makedepends=('cmake' 'git')
source=(
  "${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}-paths.patch"
)
sha256sums=(
  '7f6118bfe7b8e1ba87aa547a8cb892c29c9cc45ad817ee822121fa2142044859'
  '5ac00e5b56182ffde04c7b9ab2a5151e6cf575400705f0b061ff832116757582'
)

prepare() {
  cd ${pkgname}-${pkgver}

  sed -i 's/^cmake_minimum_required.*/cmake_minimum_required(VERSION 3.5)/' CMakeLists.txt # Bump cmake_minimum_required so that the package can be built.
  patch -Np1 -i ../${pkgname}-paths.patch
}

build() {
  cd ${pkgname}-${pkgver}

  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_DEP=OFF \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=OFF

  cmake --build build
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm755 bin/Release/${pkgname} -t \
    "${pkgdir}/usr/bin/"

  install -Dm644 bin/ignore_${pkgname}.txt -t \
    "${pkgdir}/usr/share/${pkgname}/"

  install -Dm644 LICENSE -t \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:
