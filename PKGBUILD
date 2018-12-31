# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=check_smartmon-git
pkgver=r31.07b14b8
pkgrel=1
pkgdesc="Nagios-Plugin that uses smartmontools (http://smartmontools.sourceforge.net/) to check disk health status and temperature."
arch=('any')
url="https://github.com/nihlaeth/Nagios_check_smartmon"
license=('GPL2')
depends=('python2-psutil' 'smartmontools')
makedepends=('git')
source=("${pkgname}::git+https://github.com/nihlaeth/Nagios_check_smartmon.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname" || exit 1
  # Fixing Python version
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python$#/usr/bin/python2#g'
}

package() {
  # Install License
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Put code files into '/usr/share'
  install -Dm755 "$pkgname/check_smartmon.py" "$pkgdir/usr/share/check_smartmon/check_smartmon.py"

  # Install binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/check_smartmon/check_smartmon.py" "${pkgdir}/usr/bin/check_smartmon"
}
