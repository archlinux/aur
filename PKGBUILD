# Maintainer: Your Name <your@email.com>

pkgname=rufus-linux-bin
pkgver=3.20.1929
pkgrel=1
pkgdesc="A Linux-native replica of the Rufus USB flashing utility (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/kajano-source/rufus-linux"
license=('GPL3')
depends=(
    'util-linux'
    'parted'
    'dosfstools'
    'ntfs-3g'
    'exfatprogs'
    'e2fsprogs'
    'polkit'
    'fuse2'          # required for AppImage runtime
)
provides=('rufus-linux')
conflicts=('rufus-linux')
source=("Rufus-$pkgver.AppImage::https://github.com/kajano-source/rufus-linux/releases/download/v$pkgver/Rufus-$pkgver.AppImage"
        "rufus.png::https://github.com/kajano-source/rufus-linux/raw/main/src/icons/rufus.png")
sha256sums=('dcc82c2692813d816ddb9ca9b927b4d2399551b6baec1531338191aa310d614a'
            'SKIP')

package() {
    # Install AppImage
    install -Dm755 "Rufus-$pkgver.AppImage" "$pkgdir/usr/bin/rufus-linux-bin"

    # Create a wrapper that runs the AppImage
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/rufus-linux" << 'EOF'
#!/bin/sh
exec /usr/bin/rufus-linux-bin "$@"
EOF

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/rufus-linux.desktop" << EOF
[Desktop Entry]
Name=Rufus
GenericName=USB Flasher
Comment=Flash ISO images to USB drives
Exec=rufus-linux %U
Icon=rufus-linux
Terminal=false
Type=Application
Categories=Utility;
Keywords=usb;flash;iso;bootable;
EOF

    # Install icon
    install -Dm644 "rufus.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/rufus-linux.png"

    # Install polkit policy
    install -Dm644 /dev/stdin "$pkgdir/usr/share/polkit-1/actions/com.rufus-linux.policy" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC
 "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
  <action id="com.rufus-linux.flash">
    <description>Flash ISO to USB</description>
    <message>Authentication is required to write to a USB device</message>
    <defaults>
      <allow_any>auth_admin</allow_any>
      <allow_inactive>auth_admin</allow_inactive>
      <allow_active>auth_admin_keep</allow_active>
    </defaults>
  </action>
</policyconfig>
EOF
}
