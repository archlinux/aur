# Maintainer: Your Name <your@email.com>

pkgname=rufus-linux
pkgver=3.20.1929
pkgrel=1
pkgdesc="A Linux-native replica of the Rufus USB flashing utility"
arch=('x86_64')
url="https://github.com/kajano-source/rufus-linux"
license=('GPL3')
depends=(
    'electron33'
    'util-linux'     # provides lsblk, umount
    'parted'
    'dosfstools'     # mkfs.vfat
    'ntfs-3g'        # mkfs.ntfs
    'exfatprogs'     # mkfs.exfat
    'e2fsprogs'      # mkfs.ext4
    'polkit'         # pkexec
)
makedepends=(
    'npm'
    'nodejs'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kajano-source/rufus-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with actual sha256sum after uploading to GitHub

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    npm install --ignore-scripts
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # Build just the app files, not the AppImage (we install them directly)
    npx electron-builder --linux dir
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install app files
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r dist/linux-unpacked/resources "$pkgdir/usr/lib/$pkgname/"

    # Create launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec electron33 /usr/lib/$pkgname/resources/app "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$pkgname"

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Rufus
GenericName=USB Flasher
Comment=Flash ISO images to USB drives
Exec=$pkgname %U
Icon=$pkgname
Terminal=false
Type=Application
Categories=Utility;
Keywords=usb;flash;iso;bootable;
EOF

    # Install icon
    install -Dm644 "src/icons/rufus.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

    # Install polkit policy for privilege escalation
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
