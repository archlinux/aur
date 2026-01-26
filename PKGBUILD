# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: yubimusubi <possum plus aur at possum dot cc>

pkgname=3dstool
pkgver=1.2.6
pkgrel=4
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
  patch -Np1 -i ../${pkgname}-paths.patch ||
    echo "Patch is probably already applied, continuing script execution..."
}

build() {
  cd ${pkgname}-${pkgver}

  cmake -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD64=ON \
    -D USE_DEP=OFF \
    -D CMAKE_SKIP_RPATH=ON \
    -D CMAKE_BUILD_WITH_INSTALL_RPATH=OFF \
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5

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
