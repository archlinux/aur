# Maintainer: Your Name <email@example.com>
pkgname=open-fprintd-eh575
pkgver=0.2.3
pkgrel=1
pkgdesc="Egis EH575 Fingerprint Driver and Open Fprintd Manager"
arch=('any')
url="https://github.com/abbhinavjayaraman/python-egistec-eh575"
license=('MIT')
depends=('python' 'python-dbus' 'python-gobject' 'python-numpy' 'python-opencv' 'python-pyusb' 'polkit')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/abbhinavjayaraman/python-egistec-eh575.git")
sha256sums=('SKIP')

package() {
  # Enter the subdirectory containing setup.py and the config files
  cd "${srcdir}/python-egistec-eh575/open-fprintd-eh575"

  # 1. Install Python Packages
  python setup.py install --root="$pkgdir/" --optimize=1

  # 2. Install Executables
  install -d "$pkgdir/usr/bin"
  install -m 0755 bin/open-fprintd "$pkgdir/usr/bin/"
  install -m 0755 bin/egis-bridge "$pkgdir/usr/bin/"

  # 3. Install Systemd Services
  install -d "$pkgdir/usr/lib/systemd/system"
  install -m 0644 open-fprintd.service "$pkgdir/usr/lib/systemd/system/"
  install -m 0644 egis-bridge.service "$pkgdir/usr/lib/systemd/system/"

  # 4. Install Polkit Policy
  install -d "$pkgdir/usr/share/polkit-1/actions"
  install -m 0644 net.reactivated.fprint.policy "$pkgdir/usr/share/polkit-1/actions/"

  # 5. FIXED: Install D-Bus Policy
  install -d "$pkgdir/usr/share/dbus-1/system.d"
  install -m 0644 io.github.uunicorn.Fprint.Device.Egis.conf \
    "$pkgdir/usr/share/dbus-1/system.d/io.github.uunicorn.Fprint.Device.Egis.conf"

  # 6. Create State Directory
  install -d "$pkgdir/var/lib/open-fprintd/egis"

  # 7. Install Udev Rule
  install -d "$pkgdir/usr/lib/udev/rules.d"
  install -m 0644 70-egis-eh575.rules "$pkgdir/usr/lib/udev/rules.d/"
}