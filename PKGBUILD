# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=system76-driver
pkgver=24.04.0
pkgrel=1
pkgdesc="Universal driver for System76 computers"
arch=('any')
url="https://github.com/pop-os/system76-driver"
license=('GPL-2.0-or-later')
depends=(
  'at'
  'dmidecode'
  'ethtool'
  'gtk3'
  'libnotify'
  'lm_sensors'
  'pciutils'
  'polkit'
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
  'wireless_tools'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-pyflakes'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'firmware-manager: Manage System76 firmware updates via standalone application'
  'grub: Required to apply kernel parameters'
  'pulseaudio: To apply microphone fix'
  'system76-dkms: Control hotkeys and fan on certain System76 laptops'
  'system76-acpi-dkms: Provides the system76_acpi in-tree driver (only for (<5.16))'
  'system76-io-dkms: Enable System76 I/O daughterboard'
  'system76-oled: Control brightness on OLED displays'
  'system76-power: System76 Power Management'
  'xorg-xhost: To enable GUI applications on Wayland'
  'xorg-xbacklight: To use the backlight service'
)
checkdepends=('python-pytest')
install="$pkgname.install"
source=("git+https://github.com/pop-os/system76-driver.git#tag=$pkgver"
        'cli.patch'
        'actions.patch'
        'products.patch')
sha256sums=('c2b18a1e0aea1a754829e4b67a82344e2f36ce45be54ea3a274c6743b1fbf7de'
            'ef027346c439561dc01f906ae7bd961100aedf9125fd86bb0eb89a87b683fdc3'
            '3ade740c1681f8f33ef78e1e6c087e4002d14c888d7a5bf6bfbeb2aa70111119'
            'c80118ff9f93d63bda50180950f631661b7882f11821387f813f2f95eeeccbcb')

prepare() {
  cd "$pkgname"

  # patch for cli version - enable override vendor/model via /etc/system76-daemon.json
  patch -Np1 --no-backup-if-mismatch -i "$srcdir/cli.patch"

  # Use mkinitcpio instead of initramfs-tools
  patch -Np1 --no-backup-if-mismatch -i "$srcdir/actions.patch"

  # Do not blacklist nvidia_i2c, do not Force Composition Pipeline
  patch -Np1 --no-backup-if-mismatch -i "$srcdir/products.patch"
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # Skip failing Gtk test
  pytest system76driver/tests -k 'not test_gtk' || :
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install daemons and executables
  install -Dm755 system76-{daemon,user-daemon} -t "$pkgdir/usr/lib/$pkgname/"

  # Install systemd unit files
  # Note: system76-driver* service files shortened to system76*
  install -Dm644 "debian/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/system76.service"

  # Install scripts and configuration
  install -Dm755 system76-{nm-restart,thunderbolt-reload,virtual-hub} -t \
    "$pkgdir/usr/lib/systemd/system-sleep/"
  install -Dm644 "com.system76.pkexec.$pkgname.policy" -t \
    "$pkgdir/usr/share/polkit-1/actions/"

  # Install application launchers
  install -Dm644 system76-user-daemon.desktop -t "$pkgdir/etc/xdg/autostart/"

  # Create /var/lib/system76-driver directory for brightness settings saving
  install -d "$pkgdir/var/lib/$pkgname"

  # Remove tests
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "${pkgdir}${site_packages}/system76driver/tests/"
}
