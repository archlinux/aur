# Maintainer: Leonie Ain <me@koyu.space>
pkgname=input
pkgver=0.8.2
pkgrel=2
pkgdesc="Unofficial community-developed port of the Input application for Work Louder devices on Linux"
arch=('x86_64')
url="https://github.com/worklouder/input-linux"
license=('custom')
depends=('libusb')
makedepends=('curl' 'p7zip' 'npm' 'asar' 'python311' 'git')
source=(
    "input4linux-${pkgver}.sh::https://raw.githubusercontent.com/worklouder/input-linux/main/input4linux-${pkgver}.sh"
    "install-udev-worklouder.sh::https://raw.githubusercontent.com/worklouder/input-linux/main/patch/dist-electron/scripts/install-udev-worklouder.sh"
    "appicon.png::https://raw.githubusercontent.com/worklouder/input-linux/main/patch/dist/assets/appicon.png"
    "input.desktop"
    "start.sh"
)
sha256sums=('4cffd8b8183dbfec4d5f773bafb96b488f5b0f4de0c0e5965ce633a243e61052'
            'a113e63e71520ee320e3d4ec4fb2369bc4d3bc976190efc10b3c96f0307d1d81'
            'f8d48a97e3d02e3c4eb87bfe5adbeb39cec4ca1e6dfe3c00f7cca24212c9c20b'
            '7290b288ee526c9db71f5084d66b2af4f2cd0e703a4aa9af8b81b5a5ffd95c15'
            'bd88e218ff07d212df33848d362d068d09eb397a1cf683e15b47295df307d08a')

prepare() {
    cd "$srcdir"
    chmod +x input4linux-${pkgver}.sh
    chmod +x install-udev-worklouder.sh
}

build() {
    cd "$srcdir"
    
    # Set test mode to false for proper building
    export TEST_MODE=false
    
    # Run the build script
    bash input4linux-${pkgver}.sh
}

package() {
    cd "$srcdir"
    
    # Install the application
    install -dm755 "$pkgdir/opt/input"
    cp -r input-app/* "$pkgdir/opt/input/"
    
    # Install start.sh script (overwrite if it exists from patch)
    install -Dm755 start.sh "$pkgdir/opt/input/start.sh"
    
    # Fix sandbox permissions for Electron
    if [[ -f "$pkgdir/opt/input/node_modules/electron/dist/chrome-sandbox" ]]; then
        chown root:root "$pkgdir/opt/input/node_modules/electron/dist/chrome-sandbox"
        chmod 4755 "$pkgdir/opt/input/node_modules/electron/dist/chrome-sandbox"
    fi
    
    # Symlink /opt/input/start.sh as the launcher
    install -dm755 "$pkgdir/usr/bin"
    ln -sf /opt/input/start.sh "$pkgdir/usr/bin/input"
    
    # Generate and install udev rules using the official script
    
    # Generate and install udev rules using the official script
    # Create a temporary location for the rules file
    export FAKE_ROOT="$pkgdir"
    install -dm755 "$pkgdir/usr/lib/udev/rules.d"
    
    # Run the script to generate rules, capturing its output
    # We'll use sed to extract just the rules content between the heredoc markers
    sed -n '/^sudo tee "\$TEMP_FILE"/,/^EOF$/p' install-udev-worklouder.sh | \
        sed '1d;$d' | \
        sed 's/\$VENDOR_WORKLOUDER/303a/g; s/\$VENDOR_NOMAD/574c/g; s/\$UDEV_GROUP/input/g' | \
        sed "s/\$(date)/$(date)/" > "$pkgdir/usr/lib/udev/rules.d/99-worklouder.rules"
    
    chmod 644 "$pkgdir/usr/lib/udev/rules.d/99-worklouder.rules"
    
    # Install desktop file
    install -Dm644 input.desktop "$pkgdir/usr/share/applications/input.desktop"
    
    # Install app icon
    install -Dm644 appicon.png "$pkgdir/usr/share/pixmaps/input.png"
    
    # Install license/disclaimer
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
DISCLAIMER

This project is an unofficial community-developed port of the Input application,
intended for use on Linux systems.

While this project has been acknowledged and welcomed by Work Louder Inc., it is
not officially supported or maintained by them. As such, functionality and
stability are not guaranteed.

Important Notes:
- This software is provided "as is", without any warranties, express or implied.
- Use at your own risk.
- Work Louder does not guarantee the safety, integrity, or reliability of any
  files downloaded from this repository or related sources. Users are responsible
  for reviewing and validating the software before installation.
- Work Louder cannot be held liable for any damages or legal claims resulting
  from the use or distribution of this software.

By using, copying, modifying, or distributing this software, you agree to these
terms.
EOF
}

post_install() {
    echo "=================================================="
    echo "Input has been installed to /opt/input"
    echo ""
    echo "Reloading udev rules..."
    udevadm control --reload
    udevadm trigger
    echo ""
    echo "IMPORTANT: Please unplug and replug your"
    echo "Work Louder device before launching the app."
    echo ""
    echo "Launch the app with: input"
    echo "=================================================="
}

post_upgrade() {
    post_install
}
