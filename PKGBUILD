# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Nekmo <contacto@nekmo.com>
pkgname=simple-monitor-alert
pkgver=0.2.5
pkgrel=1
pkgdesc="A simple monitor with alerts for Unix/Linux under the KISS philosophy."
arch=("any")
url=""
license=('MIT')
groups=()
depends=('python' 'python-dateutil' 'python-future' 'python-requests' 'python-six'
         'python-pip' 'python-colorclass-git' 'python-humanize' 'python-terminaltables')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=simple-monitor-alert.install
source=("simple_monitor_alert::git+https://github.com/Nekmo/simple-monitor-alert.git#branch=v0.2.5")
md5sums=("SKIP")
#source=()
#md5sums=()

package() {
  cd "$srcdir/simple_monitor_alert"
  python setup.py install --root="$pkgdir/" --optimize=1 --manual-install
  cd $pkgdir
  # Create directories
  mkdir -p usr/lib/simple-monitor-alert
  mkdir -p usr/lib/systemd/system
  mkdir -p etc/simple-monitor-alert/monitors-enabled
  # Move directories
  ls -l usr
  mv usr/alerts usr/lib/simple-monitor-alert/alerts
  mv usr/monitors usr/lib/simple-monitor-alert/monitors
  # Config file
  mv usr/sma-template.ini etc/simple-monitor-alert/sma.ini
  # Service
  mv usr/services/sma.service usr/lib/systemd/system
  # Create symlinks
  cd "$srcdir/simple_monitor_alert"
  BASE_DIR=$pkgdir python -m simple_monitor_alert.install create-symlinks
  BASE_DIR=$pkgdir python -m simple_monitor_alert.install enable-default-monitors
  # Clean
  cd $pkgdir
  rm -rf usr/services
}

# vim:set ts=2 sw=2 et: