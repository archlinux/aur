# Maintainer: Dylan Sandall <dsandalledu@gmail.com>
pkgname=smi-usbdisplay
pkgver=2.24.8.0
pkgrel=1
pkgdesc="Silicon Motion SMI USB Display driver (userspace daemon for 090c:0768)"
arch=('x86_64')
url="https://www.siliconmotion.com"
license=('custom')
depends=('evdi-dkms-git' 'libusb')
optdepends=('xorg-server: Xorg display config is installed')
install="smi-usbdisplay.install"
source=(
  "SMI-USB-Display-for-Linux-v${pkgver}.zip::https://www.siliconmotion.com/downloads/SMI-USB-Display-for-Linux-v${pkgver}.zip"
  "smiusbdisplay.service"
  "99-smiusbdisplay.rules"
  "smi-udev.sh"
  "20-smi.conf"
)
noextract=("SMI-USB-Display-for-Linux-v${pkgver}.zip")
sha256sums=(
  'bb22458b526471b79af41874712247ae12dfdcaefca638d1e2c78103751fe07f'
  'b95a0d56fe93a10ce5177e7a6a5cb52a8e2cca014a35f3976fbecb3e2b1b089a'
  'b8e1f7313cf088ad8682f534311558d095e6d47fc8824a6854c6683ddf0baa52'
  '058241b06c90232588c49d1b84b7b75cc6ddd0a0ed678d9ae124ac5517b3d86a'
  '47258acba683691c75ae897b8e5d7d2ca418a4b4f78c4359c7aca4cbde19dc35'
)

prepare() {
  unzip -o "SMI-USB-Display-for-Linux-v${pkgver}.zip"
  chmod +x "SMIUSBDisplay-driver.${pkgver}.run"
  "./SMIUSBDisplay-driver.${pkgver}.run" --noexec --target "$srcdir/smi-src"
}

package() {
  cd "$srcdir/smi-src"

  # Binary
  install -Dm755 x64/SMIUSBDisplayManager "$pkgdir/opt/siliconmotion/SMIUSBDisplayManager"

  # Firmware
  install -Dm644 Bootloader0.bin  "$pkgdir/opt/siliconmotion/Bootloader0.bin"
  install -Dm644 Bootloader1.bin  "$pkgdir/opt/siliconmotion/Bootloader1.bin"
  install -Dm644 firmware0.bin    "$pkgdir/opt/siliconmotion/firmware0.bin"
  install -Dm644 USBDisplay.bin   "$pkgdir/opt/siliconmotion/USBDisplay.bin"
  install -Dm644 USBDisplay770.bin "$pkgdir/opt/siliconmotion/USBDisplay770.bin"

  # smi-installer symlink target
  install -Dm755 install.sh "$pkgdir/opt/siliconmotion/install.sh"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/siliconmotion/install.sh "$pkgdir/usr/bin/smi-installer"

  # udev bootstrap script
  install -Dm744 "$srcdir/smi-udev.sh" "$pkgdir/opt/siliconmotion/smi-udev.sh"

  # Systemd service
  install -Dm644 "$srcdir/smiusbdisplay.service" \
    "$pkgdir/usr/lib/systemd/system/smiusbdisplay.service"

  # udev rules
  install -Dm644 "$srcdir/99-smiusbdisplay.rules" \
    "$pkgdir/etc/udev/rules.d/99-smiusbdisplay.rules"

  # Xorg config
  install -Dm644 "$srcdir/20-smi.conf" \
    "$pkgdir/usr/share/X11/xorg.conf.d/20-smi.conf"

  # Module autoload + options
  install -Dm644 /dev/stdin "$pkgdir/etc/modules-load.d/evdi.conf" <<< "evdi"
  install -Dm644 /dev/stdin "$pkgdir/etc/modprobe.d/evdi.conf" \
    <<< "options evdi initial_device_count=4"

  # Log directory
  install -dm755 "$pkgdir/var/log/SMIUSBDisplay"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
