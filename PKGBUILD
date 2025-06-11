# Maintainer: Shay Power <shaythomaspower@gmail.com>
pkgname=dawnpro-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="GUI tool for controlling the Moondrop Dawn Pro AMP/DAC"
arch=('any')
url="https://github.com/shaypower/DawnPro-GUI"
license=('MIT')
depends=('python' 'python-pyusb' 'python-gobject' 'gtk3')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shaypower/DawnPro-GUI/archive/v$pkgver.tar.gz")
sha256sums=('15d72666466d370a162882dea7635659449473199d976ba8f27d18a76877c279')

package() {
  cd "$srcdir/DawnPro-GUI-$pkgver"
  
  # Create necessary directories
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/man/man1"
  
  # Install main script
  install -Dm755 main.py "$pkgdir/usr/share/$pkgname/main.py"
  
  # Install configuration file
  install -Dm644 config.json "$pkgdir/usr/share/$pkgname/config.json"
  
  # Install device module
  cp -r device "$pkgdir/usr/share/$pkgname/"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Create launcher script
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
python /usr/share/$pkgname/main.py
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
  
  # Install man page
  cat > "$pkgdir/usr/share/man/man1/$pkgname.1" << EOF
.TH DAWNPRO-GUI 1 "June 2025" "DawnPro-GUI 1.0.0"
.SH NAME
dawnpro-gui \- GUI tool for controlling the Moondrop Dawn Pro AMP/DAC
.SH SYNOPSIS
.B dawnpro-gui
.SH DESCRIPTION
DawnPro-GUI is a graphical interface for controlling the Moondrop Dawn Pro AMP/DAC.
It allows you to:
.TP
.B *
Change the LED status (on, temp-off, off)
.TP
.B *
Set the gain (low, high)
.TP
.B *
Configure the filters
.TP
.B *
Adjust the volume
.TP
.B *
Configure settings through JSON
.SH REQUIREMENTS
.TP
.B *
Python 3.7 or higher
.TP
.B *
python-pyusb
.TP
.B *
python-gobject
.TP
.B *
gtk3
.SH FILES
.TP
.B /usr/share/dawnpro-gui/
Application files
.TP
.B ~/.config/dawnpro/config.json
User configuration file
.SH AUTHOR
Written by Shay Power <shaythomaspower@gmail.com>
.SH LICENSE
MIT License
EOF
  
  # Install udev rules
  install -Dm644 /dev/null "$pkgdir/usr/lib/udev/rules.d/99-dawn-pro.rules"
  echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="2fc6", MODE="0666"' > "$pkgdir/usr/lib/udev/rules.d/99-dawn-pro.rules"
} 