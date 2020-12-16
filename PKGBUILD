# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=system76-driver
pkgver=20.04.19
pkgrel=1
pkgdesc="Universal driver for System76 computers"
arch=('any')
url="https://github.com/pop-os/system76-driver"
license=('GPL')
install="${pkgname}.install"
depends=(
  'at'
  'dmidecode'
  'python>=3.6'
  'python-cffi'
  'python-dbus'
  'python-distro'
  'python-evdev'
  'python-gobject'
  'python-pynacl'
  'python-systemd'
  'python-xlib'
  'system76-firmware-daemon')
makepdepends=(
  'python-pyflakes')
optdepends=(
  'firmware-manager: Manage System76 firmware updates'
  'gtk3: To launch System76 driver and firmware GUI'
  'pm-utils: For power management features'
  'polkit: Run System76 Driver GUI from application menu'
  'pulseaudio: To apply microphone fix'
  'system76-dkms: Control hotkeys and fan on certain System76 laptops'
  'system76-acpi-dkms: Provides the system76_acpi in-tree driver'
  'system76-io-dkms: Enable System76 I/O daughterboard'
  'system76-oled: Control brightness on OLED displays'
  'system76-power: System76 Power Management'
  'xorg-xhost: To enable GUI applications on Wayland'
  'xorg-xbacklight: To use the backlight service')
source=(
  "https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz"
  'galu1.patch'
  'cli.patch'
  'wayland.patch')
sha1sums=('ef3645d5b918b7aebae95eaf96c4f9d206ab2c6f'
          'ddc85f9b062eb89c2c6fef0c6d7c68a28f419760'
          '916e0eeda26e00bd0372c1ffc7c5368cda9d46a1'
          '4825b80d13555742c30d197e4de56638eef162e6')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # patch for cli version - enable override vendor/model via /etc/system76-daemon.json
  patch --no-backup-if-mismatch -Np1 -i ${srcdir}/cli.patch

  # galu1 model-specific patch
  patch --no-backup-if-mismatch -Np1 -i ${srcdir}/galu1.patch

  # Use xhost for GUI apps on Wayland
  patch --no-backup-if-mismatch -Np1 -i ${srcdir}/wayland.patch
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Build and install base package
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1

  # Install daemons and executables
  install -m755 -D system76-daemon ${pkgdir}/usr/lib/${pkgname}/system76-daemon
  install -m755 -D system76-user-daemon ${pkgdir}/usr/lib/${pkgname}/system76-user-daemon
  install -m755 -D system76-driver-pkexec ${pkgdir}/usr/bin/system76-driver-pkexec

  # Install systemd unit files
  # Note: system76-driver* service files shortened to system76*
  install -m644 -D debian/system76-driver.service ${pkgdir}/usr/lib/systemd/system/system76.service

  # Install scripts and configuration
  install -m755 -D system76-nm-restart ${pkgdir}/usr/lib/${pkgname}/system76-nm-restart
  install -m755 -D system76-thunderbolt-reload ${pkgdir}/usr/lib/${pkgname}/system76-thunderbolt-reload
  install -m644 -D com.system76.pkexec.system76-driver.policy ${pkgdir}/usr/share/polkit-1/actions/com.system76.pkexec.system76-driver.policy

  # Install application launchers
  install -m644 -D system76-user-daemon.desktop ${pkgdir}/etc/xdg/autostart/system76-user-daemon.desktop

  # Create /var/lib/system76-driver directory for brightness settings saving
  install -m755 -d ${pkgdir}/var/lib/${pkgname}

  # Clean up
  rm -rf ${pkgdir}/usr/lib/python*/site-packages/system76driver/{__pycache__,tests}
}
