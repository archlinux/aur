#shellcheck shell=bash
# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgname=crau-nbd
pkgver=0.1.0
pkgrel=1
pkgdesc="Linux Network Block Device (NBD) daemon for ChromeOS/Android CrAU payload.bin"
arch=('x86_64' 'aarch64')
url="https://github.com/shadichy/crau-nbd"
license=('GPL-3.0-or-later')

depends=(
  'bzip2'
  'glibc'
  'polkit'
  'protobuf'
  'xz'
)

optdepends=(
  'mount-zip: for mounting deflated ZIP archives on-the-fly'
  'zenity: GUI partition selector dialog'
  'libnotify: desktop notifications'
)

makedepends=(
  'cmake'
  'ninja'
  'pkgconf'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shadichy/crau-nbd/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('50515f15bae45ba5542ec4ac0c4c34f9d5e55d594e456613895ccd61aa588e2f')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -G Ninja
  cmake --build build -j$(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # License
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
