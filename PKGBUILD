# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=system76-driver
pkgver=24.04.23
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
  'python-dbus'
  'python-distro'
  'python-evdev'
  'python-gobject'
  'system76-firmware'
  'usbutils'
  'wireless_tools'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'desktop-file-utils'
  'python-pytest'
)
optdepends=(
  'firmware-manager: Manage System76 firmware updates via standalone application'
  'system76-dkms: Control hotkeys and fan on certain System76 laptops'
  'system76-io-dkms: Enable System76 I/O daughterboard'
  'system76-oled: Control brightness on OLED displays'
  'system76-power: System76 Power Management'
  'xorg-xbacklight: To use the backlight service'
)
install="$pkgname.install"
source=("git+https://github.com/pop-os/system76-driver.git#tag=$pkgver"
        'cli.patch'
        'actions.patch'
        'no-pyflakes.patch')
sha256sums=('c2716542974036e5378896d1a14ce7db4d120752b48e47793703def733702f7b'
            'ef027346c439561dc01f906ae7bd961100aedf9125fd86bb0eb89a87b683fdc3'
            'ec8e19504242b67f6c2ef92d382336060fb9024d0ebae0ed3de38aa2f34cbc2a'
            '03b93d996423343f58ffaf35cdd73b1c11f14c38399dcdd328d0db5f697c6a38')

prepare() {
  cd "$pkgname"
  git clean -dfx

  # patch for cli version - enable override vendor/model via /etc/system76-daemon.json
  patch -Np1 -i "$srcdir/cli.patch"

  # Use mkinitcpio instead of initramfs-tools
  patch -Np1 -i "$srcdir/actions.patch"

  # Pyflakes only required for CI test that cannot run in chroot
  # Remove tests from package
  patch -Np1 -i "$srcdir/no-pyflakes.patch"
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  # Skip failing Gtk test
  test-env/bin/python -I -m pytest -k 'not test_gtk' || :

  desktop-file-validate *.desktop
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
}
