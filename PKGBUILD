# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sanoid-git
pkgver=r926.dbcaeef
pkgrel=1
pkgdesc="Policy-driven snapshot management (sanoid), dataset sending/receiving (syncoid) and snapshot searching (findoid) tools for ZFS."
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
  'busybox: insecure direct connection'
)
makedepends=('git')
conflicts=('sanoid')
provides=('sanoid')
source=("sanoid-git::git+https://github.com/jimsalterjrs/sanoid.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Change /usr/sbin to /usr/bin
  cd "${pkgname}"
  sed -i 's|/usr/sbin|/usr/bin|g' \
    "packages/debian/sanoid.timer" \
    "packages/debian/sanoid.service" \
    "packages/debian/sanoid.sanoid-prune.service"
}

package() {
  cd "${pkgname}"

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
  install -D -m 644 "packages/debian/sanoid.sanoid-prune.service" "${pkgdir}/usr/lib/systemd/system/sanoid-prune.service"
}
