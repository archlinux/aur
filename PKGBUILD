# Maintainer: bipin Kumar <kbipinkumar@pm.me>

pkgname=adapterremoval3
_pkgname=adapterremoval
pkgver=3.0.0
pkgrel=0
pkgdesc='Rapid adapter trimming, identification, and read merging of NGS sequence reads'
arch=('x86_64')
url='https://github.com/MikkelSchubert/adapterremoval'
license=('GPL-3.0-or-later')
provides=('adapterremoval')
conflicts=('adapterremoval')
depends=('glibc' 'gcc-libs' 'libdeflate' 'isa-l' 'libstdc++' 'libgcc')
makedepends=('python-sphinx' 'meson' 'ninja' 'uv' 'mold' 'python-fastjsonschema')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/MikkelSchubert/adapterremoval/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('08145e38f27bfd94e9c95864365726bc63e9325a8b39b973b9ab6c87bd8c93aa')

build() {
  export LDFLAGS="${LDFLAGS} -fuse-ld=mold"
  arch-meson "${_pkgname}-${pkgver}" build \
    -Duv=enabled
  meson compile -C build
}

check() {
  meson compile -C build run-unit-tests run-regression-tests
}

package() {
  meson install -C build --destdir "${pkgdir}"
  ln -s adapterremoval3 "${pkgdir}/usr/bin/adapterremoval"
}
