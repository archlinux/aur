pkgname=swscreenshot-gui
pkgver=3.0.0
pkgrel=1
pkgdesc="Screenshot app GUI for SwayWM"
arch=('x86_64')
url="https://gitlab.com/ricardoca/swscreenshot-gui"
license=('GPL')
depends=('gtk3' 'python-gobject' 'grim' 'slurp' 'wl-clipboard')
makedepends=('git')
source=("git+https://gitlab.com/ricardoca/swscreenshot-gui.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  # Install the Python script to system directory
  install -Dm755 "swscreenshot-gui.py" "$pkgdir/usr/share/$pkgname/swscreenshot-gui.py"

  # Create launcher script
  install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname"
  cat >"$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash

# Create config directory if it doesn't exist
mkdir -p "\$HOME/.config/$pkgname"

# Copy the script to user's config directory if it doesn't exist
if [ ! -f "\$HOME/.config/$pkgname/swscreenshot-gui.py" ]; then
  cp "/usr/share/$pkgname/swscreenshot-gui.py" "\$HOME/.config/$pkgname/"
  chmod +x "\$HOME/.config/$pkgname/swscreenshot-gui.py"
fi

# Run the script
python "\$HOME/.config/$pkgname/swscreenshot-gui.py"
EOF

  # Create setup script
  install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname-setup"
  cat >"$pkgdir/usr/bin/$pkgname-setup" <<EOF
#!/bin/bash

# Create config directory if it doesn't exist
mkdir -p "\$HOME/.config/$pkgname"

# Copy the script to user's config directory if it doesn't exist
if [ ! -f "\$HOME/.config/$pkgname/swscreenshot-gui.py" ]; then
  cp "/usr/share/$pkgname/swscreenshot-gui.py" "\$HOME/.config/$pkgname/"
  chmod +x "\$HOME/.config/$pkgname/swscreenshot-gui.py"
fi

# Modify sway config
SWAY_CONFIG="\$HOME/.config/sway/config"
if [ -f "\$SWAY_CONFIG" ]; then
  # Add floating window rule if not present
  if ! grep -q 'for_window \[title="Sway Screenshot GUI"\] floating enable, border normal' "\$SWAY_CONFIG"; then
    echo 'for_window [title="Sway Screenshot GUI"] floating enable, border normal' >> "\$SWAY_CONFIG"
    echo "Added floating window rule to Sway config"
  fi
  
  # Replace existing Print binding or add new one
  if grep -q 'bindsym Print exec grim' "\$SWAY_CONFIG"; then
    sed -i 's|bindsym Print exec grim|bindsym Print exec "python \$HOME/.config/$pkgname/swscreenshot-gui.py"|' "\$SWAY_CONFIG"
    echo "Updated Print key binding in Sway config"
  else
    echo 'bindsym Print exec "python \$HOME/.config/$pkgname/swscreenshot-gui.py"' >> "\$SWAY_CONFIG"
    echo "Added Print key binding to Sway config"
  fi
  
  echo "Sway configuration updated. Please run 'swaymsg reload' for changes to take effect."
else
  echo "Warning: Sway config not found at \$SWAY_CONFIG"
  echo "Please add the following lines to your Sway config manually:"
  echo 'for_window [title="Sway Screenshot GUI"] floating enable, border normal'
  echo 'bindsym Print exec "python \$HOME/.config/$pkgname/swscreenshot-gui.py"'
fi
EOF

  # Create desktop entry
  install -Dm644 /dev/null "$pkgdir/usr/share/applications/$pkgname.desktop"
  cat >"$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Sway Screenshot
Comment=Screenshot tool for Sway
Exec=/usr/bin/$pkgname
Terminal=false
Type=Application
Categories=Utility;Graphics;
Keywords=screenshot;screen;capture;
EOF

  # Add readme
  install -Dm644 /dev/null "$pkgdir/usr/share/doc/$pkgname/README.md"
  cat >"$pkgdir/usr/share/doc/$pkgname/README.md" <<EOF
# Sway Screenshot GUI

A simple GUI tool for taking screenshots in Sway window manager.

## Setup

After installation, run the setup script to configure Sway:

\`\`\`
$pkgname-setup
\`\`\`

This will:
1. Create necessary config files
2. Configure Sway to make the screenshot window float
3. Bind the Print key to launch the screenshot app

After setup, reload Sway with:
\`\`\`
swaymsg reload
\`\`\`

## Usage

Press the Print key to open the screenshot GUI, or run:
\`\`\`
$pkgname
\`\`\`

EOF
}
