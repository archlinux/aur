# Maintainer: dekart811
#
_pkgbase=veeam
pkgname=veeam
pkgver=4.0.1.2365
pkgrel=1
pkgdesc="Veeam Agent for Linux"
arch=('x86_64')
url=http://repository.veeam.com/backup/linux/agent
license=('Proprietary')
depends=('ncurses' 'lvm2' 'fuse' 'rpmextract')
install=${pkgname}.install
source=( "${url}/rpm/el/7/x86_64/veeam-${pkgver}-1.el7.x86_64.rpm" )
conflicts=("${_pkgbase}")
sha256sums=('0019944ce84cd06b76611c3f5471078934f0d1ae0d73fb9313a7f5e517993e58')
backup=('etc/veeam/veeam.ini' 'var/lib/veeam/veeam_db.sqlite' 'var/lib/veeam/veeam_db.sqlite-shm' 'var/lib/veeam/veeam_db.sqlite-wal')
#
build() {
  msg "build..."
  rpmextract.sh veeam-${pkgver}-1.el7.x86_64.rpm
  sed -i 's#/var/run#/run#' "${srcdir}/lib/systemd/system/veeamservice.service"
}
#
package() {
  # Install
  msg2 "package..."

  install -Dm 0644 "${srcdir}/etc/veeam/veeam.ini" "${pkgdir}/etc/veeam/veeam.ini"
  install -Dm 0644 "${srcdir}/lib/systemd/system/veeamservice.service" "${pkgdir}/usr/lib/systemd/system/veeamservice.service"
  install -Dm 0755 "${srcdir}/usr/bin/veeam" "${pkgdir}/usr/bin/veeam"
  install -Dm 0755 "${srcdir}/usr/bin/veeamconfig" "${pkgdir}/usr/bin/veeamconfig"
  install -Dm 0755 "${srcdir}/usr/sbin/veeammount" "${pkgdir}/usr/bin/veeammount"
  install -Dm 0755 "${srcdir}/usr/sbin/veeamagent" "${pkgdir}/usr/bin/veeamagent"
  install -Dm 0755 "${srcdir}/usr/sbin/veeamjobman" "${pkgdir}/usr/bin/veeamjobman"
  install -Dm 0755 "${srcdir}/usr/sbin/veeamservice" "${pkgdir}/usr/bin/veeamservice"
  install -Dm 0644 "${srcdir}/usr/share/doc/veeam/3rd_party" "${pkgdir}/usr/share/doc/veeam/3rd_party"
  install -Dm 0644 "${srcdir}/usr/share/doc/veeam/EULA" "${pkgdir}/usr/share/doc/veeam/EULA"
  install -Dm 0644 "${srcdir}/usr/share/man/man8/veeam.8" "${pkgdir}/usr/share/man/man8/veeam.8"  
  install -Dm 0644 "${srcdir}/usr/share/man/man8/veeamconfig.8" "${pkgdir}/usr/share/man/man8/veeamconfig.8"
  install -Dm 0644 "${srcdir}/usr/share/veeam/lpb_scheme.sql" "${pkgdir}/usr/share/veeam/lpb_scheme.sql"
  install -Dm 0644 "${srcdir}/usr/share/veeam/lpb_upgrade_scheme.sql" "${pkgdir}/usr/share/veeam/lpb_upgrade_scheme.sql"
}
