# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=system76-driver
pkgver=20.04.70
pkgrel=1
pkgdesc="Universal driver for System76 computers"
arch=('any')
url="https://github.com/pop-os/system76-driver"
license=('GPL')
depends=('at' 'dmidecode' 'ethtool' 'gtk3' 'lm_sensors' 'pciutils' 'polkit'
         'python' 'python-cffi' 'python-dbus' 'python-distro' 'python-evdev'
         'python-gobject' 'python-pynacl' 'python-systemd' 'python-xlib'
         'system76-firmware-daemon' 'usbutils' 'wireless_tools')
makedepends=('git' 'python-build' 'python-installer' 'python-pyflakes' 'python-wheel')
optdepends=(
  'firmware-manager: Manage System76 firmware updates via standalone application'
  'grub: Required to apply kernel parameters'
  'pm-utils: For power management features'
  'pulseaudio: To apply microphone fix'
  'system76-dkms: Control hotkeys and fan on certain System76 laptops'
  'system76-acpi-dkms: Provides the system76_acpi in-tree driver (only for (<5.16)'
  'system76-io-dkms: Enable System76 I/O daughterboard'
  'system76-oled: Control brightness on OLED displays'
  'system76-power: System76 Power Management'
  'xorg-xhost: To enable GUI applications on Wayland'
  'xorg-xbacklight: To use the backlight service')
install="$pkgname.install"
_commit=453a9280e489aa0e787eb878ead6e9e93a1c744c  # tags/20.04.70^0
source=(
#  "git+https://github.com/pop-os/system76-driver.gitcommit=${_commit}?signed"
  "git+https://github.com/pop-os/system76-driver.git#commit=${_commit}"
  'cli.patch'
  'wayland.patch'
  'actions.patch')
sha256sums=('SKIP'
            'ef027346c439561dc01f906ae7bd961100aedf9125fd86bb0eb89a87b683fdc3'
            '2ffbd813744c0b99416947a2755767767af434758aa20dcfafefb49fb367d5d3'
            '3ade740c1681f8f33ef78e1e6c087e4002d14c888d7a5bf6bfbeb2aa70111119')
#validpgpkeys=('D3FB3AF9711C1CD12639C9F587F211AF2BE4C2FE') # Jeremy Soller (https://soller.dev) <jackpot51@gmail.com>

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"

  # patch for cli version - enable override vendor/model via /etc/system76-daemon.json
  patch --no-backup-if-mismatch -Np1 -i $srcdir/cli.patch

  # Use xhost for GUI apps on Wayland
  patch --no-backup-if-mismatch -Np1 -i $srcdir/wayland.patch

  # Use mkinitcpio instead of initramfs-tools
  patch --no-backup-if-mismatch -Np1 -i $srcdir/actions.patch

  # Force Composition Pipeline no longer necessary
  sed -i '/            actions.nvidia_forcefullcompositionpipeline,/d' \
    system76driver/products.py

  # Blacklisting nvidia_i2c accomplishes nothing
  sed -i '/           actions.blacklist_nvidia_i2c,/d' \
    system76driver/products.py
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install daemons and executables
  install -Dm755 system76-daemon system76-user-daemon -t "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 "$pkgname-pkexec" -t "$pkgdir/usr/bin/"

  # Install systemd unit files
  # Note: system76-driver* service files shortened to system76*
  install -Dm644 "debian/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/system76.service"

  # May only be needed with kernel 5.17.15
  # https://github.com/pop-os/linux/pull/156
  # https://github.com/pop-os/system76-driver/pull/242
#  install -Dm644 "lib/systemd/system-sleep/${pkgname}_bluetooth-suspend" -t \
#   "$pkgdir/usr/lib/systemd/system-sleep/"

  # Install scripts and configuration
  install -m755 system76-nm-restart system76-thunderbolt-reload "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 "com.system76.pkexec.$pkgname.policy" -t \
    "$pkgdir/usr/share/polkit-1/actions/"

  # Install application launchers
  install -Dm644 system76-user-daemon.desktop -t "$pkgdir/etc/xdg/autostart/"

  # Create /var/lib/system76-driver directory for brightness settings saving
  install -d "$pkgdir/var/lib/$pkgname"

  # Remove tests
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir$site_packages/system76driver/tests/"
}
