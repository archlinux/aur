# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=system76-driver
pkgver=20.04.28
pkgrel=3
pkgdesc="Universal driver for System76 computers"
arch=('any')
url="https://github.com/pop-os/system76-driver"
license=('GPL')
depends=(
  'at'
  'dmidecode'
  'ethtool'
  'grub'
  'pciutils'
  'python>=3.6'
  'python-cffi'
  'python-dbus'
  'python-distro'
  'python-evdev'
  'python-gobject'
  'python-pynacl'
  'python-systemd'
  'python-xlib'
  'system76-firmware-daemon'
  'usbutils'
  'wireless_tools')
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
install="$pkgname.install"
source=(
  "$pkgname-$pkgver::https://github.com/pop-os/system76-driver/archive/$pkgver.tar.gz"
  'galu1.patch'
  'cli.patch'
  'wayland.patch'
  'actions.patch')
sha256sums=('dddf3749f8e5d833f0e10d418bbe4d8670b21d1c19498565028f21d10b11678f'
            '2ccf53ec0ffdeea00930d218253f5b3db2bdc7d3405e8353caabc36107f3ab26'
            'ef027346c439561dc01f906ae7bd961100aedf9125fd86bb0eb89a87b683fdc3'
            '2ffbd813744c0b99416947a2755767767af434758aa20dcfafefb49fb367d5d3'
            '3ade740c1681f8f33ef78e1e6c087e4002d14c888d7a5bf6bfbeb2aa70111119')


prepare() {
  cd "$pkgname-$pkgver"

  # patch for cli version - enable override vendor/model via /etc/system76-daemon.json
  patch --no-backup-if-mismatch -Np1 -i $srcdir/cli.patch

  # galu1 model-specific patch
  patch --no-backup-if-mismatch -Np1 -i $srcdir/galu1.patch

  # Use xhost for GUI apps on Wayland
  patch --no-backup-if-mismatch -Np1 -i $srcdir/wayland.patch

  # Use mkinitcpio instead of initramfs-tools
  patch --no-backup-if-mismatch -Np1 -i $srcdir/actions.patch
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  # Install base package
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build

  # Install daemons and executables
  install -Dm755 system76-daemon -t "$pkgdir/usr/lib/$pkgname"
  install -m755 system76-user-daemon -t "$pkgdir/usr/lib/$pkgname"
  install -Dm755 system76-driver-pkexec -t "$pkgdir/usr/bin"

  # Install systemd unit files
  # Note: system76-driver* service files shortened to system76*
  install -Dm644 debian/system76-driver.service \
    "$pkgdir/usr/lib/systemd/system/system76.service"

  # Install scripts and configuration
  install -m755 system76-nm-restart "$pkgdir/usr/lib/$pkgname"
  install -m755 system76-thunderbolt-reload -t "$pkgdir/usr/lib/$pkgname"
  install -Dm644 com.system76.pkexec.system76-driver.policy -t \
    "$pkgdir/usr/share/polkit-1/actions"

  # Install application launchers
  install -Dm644 system76-user-daemon.desktop -t "$pkgdir/etc/xdg/autostart"

  # Create /var/lib/system76-driver directory for brightness settings saving
  install -dm755 "$pkgdir/var/lib/$pkgname"

  # Clean up
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf $pkgdir$site_packages/system76driver/{__pycache__,tests}
}
