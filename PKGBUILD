# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sanoid
pkgver=2.1.0
pkgrel=1
pkgdesc="A policy-driven snapshot management tool for ZFS filesystems."
arch=('any')
url='https://github.com/jimsalterjrs/sanoid'
license=('GPL3')
backup=('etc/sanoid/sanoid.conf')
depends=(
  'perl-capture-tiny'
  'perl-config-inifiles'
)
optdepends=(
  'pv: progress bars'
  'mbuffer: stream buffering'
  'gzip: compression'
  'pigz: compression'
  'zstd: compression'
  'lz4: compression'
  'xz: compression'
  'lzop: compression'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/jimsalterjrs/sanoid/archive/v$pkgver.tar.gz"
)

sha256sums=('97b41f689a7ea23671dac3fcb20540f6d3aee880ed3282df7448756f99e7040e')

prepare() {
  # Change /usr/sbin to /usr/bin
  cd "${srcdir}/sanoid-${pkgver}"
  sed -i 's|/usr/sbin|/usr/bin|g' \
    "packages/debian/sanoid.timer" \
    "packages/debian/sanoid.service" \
    "packages/debian/sanoid-prune.service"
}

package() {
  cd "${srcdir}/sanoid-${pkgver}"

  # Documents
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sanoid/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/sanoid/README.md"

  # Configs
  install -Dm644 sanoid.conf "${pkgdir}/etc/sanoid/sanoid.conf"
  install -Dm644 sanoid.defaults.conf "${pkgdir}/etc/sanoid/sanoid.defaults.conf"

  # Binaries
  install -Dm755 sanoid "${pkgdir}/usr/bin/sanoid"
  install -Dm755 syncoid "${pkgdir}/usr/bin/syncoid"
  install -Dm755 findoid "${pkgdir}/usr/bin/findoid"

  # systemd
  install -D -m 644 "packages/debian/sanoid.timer" "${pkgdir}/usr/lib/systemd/system/sanoid.timer"
  install -D -m 644 "packages/debian/sanoid.service" "${pkgdir}/usr/lib/systemd/system/sanoid.service"
  install -D -m 644 "packages/debian/sanoid-prune.service" "${pkgdir}/usr/lib/systemd/system/sanoid-prune.service"
}
