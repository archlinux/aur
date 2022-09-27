# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=check_zfs-git
pkgver=r62.e3cf94c
pkgrel=1
pkgdesc="Nagios-Plugin to check the status of a ZFS pool."
arch=('i686' 'x86_64')
url="https://github.com/zlacelle/nagios_check_zfs_linux"
license=('GPL3')
makedepends=('git')
depends=('python')
source=("${pkgname}::git+https://github.com/zlacelle/nagios_check_zfs_linux.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python$#/usr/bin/python2#g'
}

package() {
  # Install License
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Put code files into '/usr/share'
  install -Dm755 "$pkgname/check_zfs.py" "$pkgdir/usr/share/check_zfs/check_zfs.py"

  # Install binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/check_zfs/check_zfs.py" "${pkgdir}/usr/bin/check_zfs"
}
