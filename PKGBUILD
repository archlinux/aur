pkgname=neodisk-bin
pkgver=2.91.0
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
sha256sums_x86_64=('aa8f5e2fad538ef690d7328623c428964dc38f9789e56ff9aba3f640b1415ff0')
sha256sums_aarch64=('3fbdada5f561261f7238fe14c1679a01eea4604e298b7dc5f90676cfed812f2b')
source_x86_64=("${url}/releases/download/v${pkgver}/neodisk-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/neodisk-${pkgver}-linux-aarch64.tar.gz")

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
