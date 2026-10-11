pkgname=neodisk-bin
pkgver=2.83.2
pkgrel=1
pkgdesc="Disk space visualizer with treemap and sunburst views (upstream binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/tkslucas/Neodisk"
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphene'
  'gtk4>=4.14'
  'harfbuzz'
  'libadwaita>=1.5'
  'pango'
  'vulkan-icd-loader'
  'zstd'
)
makedepends=('patchelf')
provides=("neodisk=${pkgver}")
conflicts=('neodisk' 'neodisk-git')
options=('!debug' '!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/tkslucas/Neodisk/v${pkgver}/LICENSE")
sha256sums=('49f51e89dd0718b6df57c50b4148336512ab72905b14bd17334b4aaf4e60322f')
source_x86_64=("${url}/releases/download/v${pkgver}/neodisk-${pkgver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('2f82d4219ecc2c6a21a3a696b1d828db33c51afd43109a45a127bf9d2fe7b079')
source_aarch64=("${url}/releases/download/v${pkgver}/neodisk-${pkgver}-linux-aarch64.tar.gz")
sha256sums_aarch64=('01dd82949a0dccb7aa7cdef79078be6a1e80825f0a914965b8c572df43b576b4')

prepare() {
  patchelf --remove-rpath bin/neodisk
  sed -i 's|^Exec=.*|Exec=neodisk|' \
    share/applications/com.lucastakayasu.Neodisk.desktop
}

check() {
  ldd -r bin/neodisk > neodisk-ldd.log
  if grep -Eq 'not found|undefined symbol' neodisk-ldd.log; then
    cat neodisk-ldd.log
    return 1
  fi
  local lib
  for lib in libgtk-4.so.1 libadwaita-1.so.0 libzstd.so.1; do
    if ! grep -Fq "${lib} => /usr/lib/" neodisk-ldd.log; then
      cat neodisk-ldd.log
      error "${lib} must use the Arch Linux system library"
      return 1
    fi
  done
}

package() {
  install -Dm755 bin/neodisk "${pkgdir}/usr/bin/neodisk"
  install -d "${pkgdir}/usr/share"
  cp -a share/. "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
