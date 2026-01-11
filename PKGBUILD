# Maintainer: Jayabbhi <abbhinavjayaraman@gmail.com>
pkgname=open-fprintd-eh575
pkgver=0.2.4
pkgrel=2
pkgdesc="Egis EH575 Fingerprint Driver and Open Fprintd Manager (Isolated /opt Install)"
arch=('any')
url="https://github.com/abbhinavjayaraman/python-egistec-eh575"
license=('MIT')
depends=('python' 'python-dbus' 'python-gobject' 'python-numpy' 'python-opencv' 'python-pyusb' 'polkit' 'dbus')
makedepends=('git')
provides=('fprintd')
conflicts=('open-fprintd-git') 
source=("git+https://github.com/abbhinavjayaraman/python-egistec-eh575.git")
sha256sums=('SKIP')

package() {
  # Enter the subdirectory containing the source code
  cd "${srcdir}/python-egistec-eh575/open-fprintd-eh575"

  # --- 1. Define Installation Directory (/opt Isolation) ---
  local _optdir="$pkgdir/opt/egis-driver"
  install -d "$_optdir"

  # --- 2. Install Executables & Libraries ---
  # Copy manually to /opt to bypass system python versioning
  cp -r bin/open-fprintd bin/egis-bridge "$_optdir/"
  cp -r openfprintd egis_driver "$_optdir/"
  
  # Set executable permissions
  chmod 755 "$_optdir/open-fprintd"
  chmod 755 "$_optdir/egis-bridge"

  # --- 3. Create Storage Directory ---
  install -d "$_optdir/enrolled_prints"
  chmod 700 "$_optdir/enrolled_prints"

  # --- 4. Install Systemd Services (Now just copying your updated files) ---
  install -d "$pkgdir/usr/lib/systemd/system"
  install -m 0644 open-fprintd.service "$pkgdir/usr/lib/systemd/system/"
  install -m 0644 egis-bridge.service "$pkgdir/usr/lib/systemd/system/"

  # --- 5. Install System Configurations ---
  
  # Polkit Policy
  install -D -m 0644 net.reactivated.fprint.policy "$pkgdir/usr/share/polkit-1/actions/net.reactivated.fprint.policy"

  # DBus Policy (Install to /usr/share for packages)
  install -D -m 0644 io.github.uunicorn.Fprint.Device.Egis.conf "$pkgdir/usr/share/dbus-1/system.d/io.github.uunicorn.Fprint.Device.Egis.conf"

  # Udev Rule
  install -D -m 0644 70-egis-eh575.rules "$pkgdir/usr/lib/udev/rules.d/70-egis-eh575.rules"
}