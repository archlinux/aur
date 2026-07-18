# Maintainer: Jairo Galeano <jairogaleano@gmail.com>
pkgname=timeshift-uki-hooks-git
pkgver=v3.0
pkgrel=1
pkgdesc="Hooks inteligentes para Timeshift que sincronizan imágenes UKI (Unified Kernel Images) con snapshots Btrfs"
arch=('any')
url="https://github.com/jairogaleano/timeshift-uki-hooks"
license=('GPL-3.0-or-later')
depends=('timeshift' 'bash' 'coreutils' 'util-linux')
makedepends=('git')
provides=('timeshift-uki-hooks')
conflicts=('timeshift-uki-hooks')
install=timeshift-uki-hooks.install
source=("git+https://github.com/jairogaleano/timeshift-uki-hooks.git")
sha256sums=('SKIP')

pkgver() {
  cd "timeshift-uki-hooks"
  git describe --long --always --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "timeshift-uki-hooks"

  install -d "${pkgdir}/etc/timeshift/backup-hooks.d"
  install -d "${pkgdir}/etc/timeshift/restore-hooks.d"

  install -m755 hooks.d/backup/90-backup-uki "${pkgdir}/etc/timeshift/backup-hooks.d/90-backup-uki"
  install -m755 hooks.d/restore/90-restore-uki "${pkgdir}/etc/timeshift/restore-hooks.d/90-restore-uki"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
