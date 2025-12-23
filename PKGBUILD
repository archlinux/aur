# Maintainer: Shay Power <shaythomaspower@gmail.com>
pkgname=dawnpro-gui
pkgver=1.1.0
pkgrel=1
pkgdesc="GUI tool for controlling the Moondrop Dawn Pro AMP/DAC"
arch=('any')
url="https://github.com/shaypower/DawnPro-GUI"
license=('MIT')
depends=('python3' 'python-pyusb' 'python-gobject' 'gtk3')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shaypower/DawnPro-GUI/archive/v$pkgver.tar.gz")
sha256sums=('9a7281aa6d64d63ddc040b27a9cdbd6fb87ea766273e5d96ce78220082f888e3')

package() {
  cd "$srcdir/DawnPro-GUI-$pkgver"
  
  # Create necessary directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -dm755 "$pkgdir/usr/share/applications"
  
  # Install main script
  install -Dm755 main.py "$pkgdir/usr/share/$pkgname/main.py"
  
  # Install configuration file
  install -Dm644 config.json "$pkgdir/usr/share/$pkgname/config.json"
  
  # Install device module
  cp -r device "$pkgdir/usr/share/$pkgname/"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install man page
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  
  # Create launcher script
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
python3 /usr/share/$pkgname/main.py
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"
  
  # Install desktop entry
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=DawnPro GUI
Comment=Control the Moondrop Dawn Pro AMP/DAC
Exec=dawnpro-gui
Icon=audio-card
Terminal=false
Type=Application
Categories=AudioVideo;Audio;
EOF
  
  # Install udev rules
  install -Dm644 /dev/null "$pkgdir/usr/lib/udev/rules.d/99-dawn-pro.rules"
  echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="2fc6", MODE="0666"' > "$pkgdir/usr/lib/udev/rules.d/99-dawn-pro.rules"
} 